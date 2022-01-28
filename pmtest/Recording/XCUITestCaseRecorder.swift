//
//  XCUITestCaseRecorder.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import XCTest

public class XCUITestCaseRecorder {
    
    struct Constants {
        static let minimumRequiredScreenshotSize: CGSize = .init(width: 10, height: 10)
        static let fallbackMp4Extension = "mp4"
        static let fallbackGifExtension = "gif"
    }
    
    private let testName: String
    private var screenshotTimer: Timer?
    private var screenshots = [UIImage]()
    var timeInterval: TimeInterval = 0.3
    
    init(testName: String) {
        self.testName = testName
    }
    
    func resumeRecording() {
        self.screenshotTimer = Timer.scheduledTimer(timeInterval: timeInterval,
                                                    target: self, selector: #selector(saveScreenshot),
                                                    userInfo: nil, repeats: true)
    }
    
    func pauseRecording() {
        self.screenshotTimer?.invalidate()
        self.screenshotTimer = nil
    }
    
    func generateGifAttachment() -> XCTAttachment? {
        pauseRecording()
        guard let directoryUrl = FileManagerUtils.createFolderInDocumentsDirectory(folderName: testName) else {
            self.screenshots.removeAll()
            return nil
        }
        let result = self.createGIF(from: self.screenshots, directoryPath: directoryUrl.path)
        self.screenshots.removeAll()
        if let fileURL = result.fileUrl, result.success {
            let attachment = XCTAttachment(contentsOfFile: fileURL)
            attachment.lifetime = .keepAlways
            return attachment
        } else {
            return nil
        }
    }
    
    func generateVideoAttachment(completion: @escaping (XCTAttachment?) -> Void) {
        pauseRecording()
        guard let directoryUrl = FileManagerUtils.createFolderInDocumentsDirectory(folderName: testName) else {
            self.screenshots.removeAll()
            completion(nil)
            return
        }
        self.createVideo(from: self.screenshots, directoryPath: directoryUrl.path) { success, fileURL in
            self.screenshots.removeAll()
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
    
    @objc private func saveScreenshot() {
        let screenshotImage = XCUIScreen.main.screenshot().image
        let imageSize = screenshotImage.size
        let minimumSize = Constants.minimumRequiredScreenshotSize
        if imageSize.height > minimumSize.height && imageSize.width > minimumSize.width {
            self.screenshots.append(screenshotImage)
        }
    }
    
    private func createGIF(from images: [UIImage], directoryPath: String) -> (success: Bool, fileUrl: URL?) {
        let utTypeGif = UTTypeProvider.provideGifUTTypeIdentifier()
        let fileExtension = FileExtensionProvider.provideFileExtension(utTypeIdentifier: utTypeGif) ?? Constants.fallbackGifExtension
        
        let fileUrl = URL(fileURLWithPath: "\(directoryPath)/\(testName).\(fileExtension)")
        try? FileManager.default.removeItem(atPath: fileUrl.path)
        
        let configuration = GifGenerationConfiguration(utType: utTypeGif as CFString, outputUrl: fileUrl)
        let gifGenerator = GifGenerator(configuration: configuration, images: images)
        return (gifGenerator.generate(), fileUrl)
    }
    
    private func createVideo(from images: [UIImage],
                             directoryPath: String,
                             completion: @escaping ((_ success: Bool, _ fileUrl: URL?) -> Void)) {
        let fileType = AVFileTypeProvider.provideMp4AVFileType()
        let fileExtension = FileExtensionProvider.provideFileExtension(avFileType: fileType) ?? Constants.fallbackMp4Extension
        
        let fileUrl = URL(fileURLWithPath: "\(directoryPath)/\(testName).\(fileExtension)")
        try? FileManager.default.removeItem(atPath: fileUrl.path)
        
        let configuration = VideoGenerationConfiguration(outputUrl: fileUrl, fileType: fileType)
        if let videoGenerator = VideoGenerator(configuration: configuration, images: images) {
            videoGenerator.generate(completion: { success in
                completion(success, fileUrl)
            })
        } else {
            completion(false, nil)
        }
    }
}
