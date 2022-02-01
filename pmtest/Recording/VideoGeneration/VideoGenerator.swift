//
//  VideoGenerator.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import UIKit
import Photos

final class VideoGenerator {

    private let configuration: VideoGenerationConfiguration
    private let videoWriter: VideoWriter
    private var images: [UIImage]
    private var currentFrameNumber = 0

    // MARK: - Initialization

    init?(configuration: VideoGenerationConfiguration, images: [UIImage]) {
        self.configuration = configuration
        self.images = images
        if let videoWriter = VideoWriter(configuration: configuration) {
            self.videoWriter = videoWriter
        } else {
            return nil
        }
    }

    // MARK: - Public

    func generate(completion: @escaping ((Bool) -> Void)) {
        guard videoWriter.start() == true else {
            completion(false)
            return
        }
        videoWriter.render(appendPixelBuffers: appendPixelBuffers) { success in
            completion(success)
        }
    }

    func appendPixelBuffers(writer: VideoWriter) -> AppendPixelBuffersOutput {
        let frameDuration = CMTimeMakeWithSeconds(configuration.frameDurationInSeconds, preferredTimescale: configuration.timescale)
        while !images.isEmpty {
            if writer.isReadyForData == false {
                return .init(isFinished: false, success: true)
            }
            let image = images.removeFirst()
            let presentationTime = CMTimeMultiply(frameDuration, multiplier: Int32(currentFrameNumber))
            if !videoWriter.addImage(image: image, withPresentationTime: presentationTime) {
                return .init(isFinished: true, success: false)
            }
            currentFrameNumber += 1
        }
        return .init(isFinished: true, success: true)
    }
}
