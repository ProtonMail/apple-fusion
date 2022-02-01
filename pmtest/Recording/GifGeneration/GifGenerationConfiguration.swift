//
//  GifGenerationConfiguration.swift
//  pmtest
//
//  Created by Aram Sargsyan on 28.01.22.
//

import AVFoundation

struct GifGenerationConfiguration {

    var utType: CFString
    var outputUrl: URL
    var loopCount: Int = 1
    var delayTime: Double = 0.1

    var fileProperties: [String: Any] {
        [ kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: loopCount] ]
    }

    var frameProperties: [String: Any] {
        [ kCGImagePropertyGIFDictionary as String: [(kCGImagePropertyGIFDelayTime as String): delayTime] ]
    }
}
