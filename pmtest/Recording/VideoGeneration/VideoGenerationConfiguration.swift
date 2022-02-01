//
//  VideoGenerationConfiguration.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import AVFoundation
import UIKit
import Photos

struct VideoGenerationConfiguration {

    var outputUrl: URL
    var fileType: AVFileType
    var size: CGSize = UIScreen.main.bounds.size
    var fps: Int32 = 60
    var avCodecKey: AVVideoCodecType = .h264
    var timescale: Int32 = 600
    var frameDurationInSeconds: Float64 = 0.3

    var avOutputSettings: [String: Any] {
        [ AVVideoCodecKey: avCodecKey,
          AVVideoWidthKey: NSNumber(value: Float(size.width)),
          AVVideoHeightKey: NSNumber(value: Float(size.height)) ]
    }
}

struct AppendPixelBuffersOutput {
    let isFinished: Bool
    let success: Bool
}
