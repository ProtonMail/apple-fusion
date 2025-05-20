//
//  XCUITestCaseRecorder.swift
//
//  ProtonMail - Created on 26.01.22.
//
//  The MIT License
//
//  Copyright (c) 2020 Proton Technologies AG
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS)
import UIKit
import XCTest

@MainActor
final class XCUITestCaseRecorder {

    private struct Constants {
        static let minimumRequiredScreenshotSize: CGSize = .init(width: 10, height: 10)
        static let fallbackMp4Extension = "mp4"
        static let fallbackGifExtension = "gif"
    }

    private let testName: String
    private var screenshotTimer: Timer?
    private var screenshots: [UIImage] = []
    var timeInterval: TimeInterval = 0.3

    // MARK: - Initialization

    init(testName: String) {
        self.testName = testName
    }

    // MARK: - Public

    func resumeRecording() {
        screenshotTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task {
                await saveScreenshot()
            }
        }
    }

    func pauseRecording() {
        screenshotTimer?.invalidate()
        screenshotTimer = nil
    }

    func generateGifAttachment() -> XCTAttachment? {
        pauseRecording()
        guard let directoryUrl = FileManagerUtils.createFolderInDocumentsDirectory(folderName: testName) else {
            screenshots.removeAll()
            return nil
        }


        let result = createGIF(from: &screenshots, directoryPath: directoryUrl.path)

        if let fileURL = result.fileUrl, result.success {
            let attachment = XCTAttachment(contentsOfFile: fileURL)
            attachment.lifetime = .keepAlways
            return attachment
        }
        return nil
    }

    func generateVideoAttachment(completion: @Sendable @escaping (XCTAttachment?) -> Void) {
        pauseRecording()
        guard let directoryUrl = FileManagerUtils.createFolderInDocumentsDirectory(folderName: testName) else {
            screenshots.removeAll()
            completion(nil)
            return
        }

        createVideo(from: &screenshots, directoryPath: directoryUrl.path) { success, fileURL in
            if let fileURL = fileURL, success {
                let attachment = XCTAttachment(contentsOfFile: fileURL)
                attachment.lifetime = .keepAlways
                completion(attachment)
            } else {
                completion(nil)
            }
        }
    }

    // MARK: - Private

    private func saveScreenshot() {
        let screenshotImage = XCUIScreen.main.screenshot().image
        let imageSize = screenshotImage.size
        let minimumSize = Constants.minimumRequiredScreenshotSize

        guard imageSize.height > minimumSize.height,
              imageSize.width > minimumSize.width else { return }
        screenshots.append(screenshotImage)
    }

    private func createGIF(from images: inout [UIImage],
                           directoryPath: String) -> (success: Bool, fileUrl: URL?) {
        defer { images.removeAll() }
        let utTypeGif = UTTypeProvider.provideGifUTTypeIdentifier()
        let fileExtension = FileExtensionProvider.provideFileExtension(utTypeIdentifier: utTypeGif) ?? Constants.fallbackGifExtension

        let fileUrl = URL(fileURLWithPath: "\(directoryPath)/\(testName).\(fileExtension)")
        try? FileManager.default.removeItem(atPath: fileUrl.path)

        let config = GifGenerationConfiguration(utType: utTypeGif as CFString, outputUrl: fileUrl)
        let gifGenerator = GifGenerator(configuration: config, images: images)
        return (gifGenerator.generate(), fileUrl)
    }

    private func createVideo(from images: inout [UIImage],
                             directoryPath: String,
                             completion: @Sendable @escaping (_ success: Bool, _ fileUrl: URL?) -> Void) {
        defer { images.removeAll() }
        let fileType = AVFileTypeProvider.provideMp4AVFileType()
        let fileExtension = FileExtensionProvider.provideFileExtension(avFileType: fileType) ?? Constants.fallbackMp4Extension

        let fileUrl = URL(fileURLWithPath: "\(directoryPath)/\(testName).\(fileExtension)")
        try? FileManager.default.removeItem(atPath: fileUrl.path)

        let config = VideoGenerationConfiguration(outputUrl: fileUrl, fileType: fileType)
        if let videoGenerator = VideoGenerator(configuration: config, images: images) {
            videoGenerator.generate { success in
                completion(success, fileUrl)
            }
        } else {
            completion(false, nil)
        }
    }
}
#endif
