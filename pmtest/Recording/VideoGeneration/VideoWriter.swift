//
//  VideoWriter.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import UIKit
import AVFoundation

final class VideoWriter {

    private let configuration: VideoGenerationConfiguration
    private let videoWriter: AVAssetWriter!
    private var videoWriterInput: AVAssetWriterInput!
    private var pixelBufferAdaptor: AVAssetWriterInputPixelBufferAdaptor!

    var isReadyForData: Bool {
        return videoWriterInput.isReadyForMoreMediaData
    }

    // MARK: - Initialization

    init?(configuration: VideoGenerationConfiguration) {
        self.configuration = configuration
        if let videoWriter = try? AVAssetWriter(outputURL: configuration.outputUrl, fileType: configuration.fileType),
           videoWriter.canApply(outputSettings: configuration.avOutputSettings, forMediaType: AVMediaType.video) {
            self.videoWriter = videoWriter
        } else {
            return nil
        }
        self.videoWriterInput = AVAssetWriterInput(mediaType: .video, outputSettings: configuration.avOutputSettings)
        if videoWriter.canAdd(videoWriterInput) {
            videoWriter.add(videoWriterInput)
        } else {
            return nil
        }
        let attributes = [
            kCVPixelBufferPixelFormatTypeKey as String: NSNumber(value: kCVPixelFormatType_32ARGB),
            kCVPixelBufferWidthKey as String: NSNumber(value: Float(configuration.size.width)),
            kCVPixelBufferHeightKey as String: NSNumber(value: Float(configuration.size.height))
        ]
        pixelBufferAdaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: videoWriterInput,
                                                                  sourcePixelBufferAttributes: attributes)
    }

    func start() -> Bool {
        guard videoWriter.startWriting() else {
            return false
        }
        videoWriter.startSession(atSourceTime: .zero)
        return pixelBufferAdaptor.pixelBufferPool != nil
    }

    func render(appendPixelBuffers: @escaping ((VideoWriter) -> AppendPixelBuffersOutput),
                completion: @escaping (Bool) -> Void) {
        let queue = DispatchQueue(label: String(describing: VideoWriter.self))
        videoWriterInput.requestMediaDataWhenReady(on: queue) {
            let output = appendPixelBuffers(self)
            guard output.success else {
                completion(false)
                return
            }
            if output.isFinished {
                self.videoWriterInput.markAsFinished()
                self.videoWriter.finishWriting {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
            }
        }
    }

    func addImage(image: UIImage, withPresentationTime presentationTime: CMTime) -> Bool {
        guard let pixelBufferPool = pixelBufferAdaptor.pixelBufferPool else { return false }
        if let pixelBuffer = PixelBufferFactory.pixelBufferFromImage(image: image,
                                                                     pixelBufferPool: pixelBufferPool,
                                                                     renderSettings: configuration) {
            return pixelBufferAdaptor.append(pixelBuffer, withPresentationTime: presentationTime)
        }
        return false
    }
}
