//
//  GifGenerator.swift
//  pmtest
//
//  Created by Aram Sargsyan on 28.01.22.
//

import UIKit
import UniformTypeIdentifiers
import MobileCoreServices

final class GifGenerator {
    private let configuration: GifGenerationConfiguration
    private var images: [UIImage]

    // MARK: - Initialization

    init(configuration: GifGenerationConfiguration, images: [UIImage]) {
        self.configuration = configuration
        self.images = images
    }

    func generate() -> Bool {
        guard let url = configuration.outputUrl as CFURL?,
              let destination = CGImageDestinationCreateWithURL(url, configuration.utType, images.count, nil) else {
            return false
        }

        CGImageDestinationSetProperties(destination, configuration.fileProperties as CFDictionary)
        images.compactMap(\.cgImage).forEach {
            CGImageDestinationAddImage(destination, $0, configuration.frameProperties as CFDictionary)
        }

        return CGImageDestinationFinalize(destination)
    }
}
