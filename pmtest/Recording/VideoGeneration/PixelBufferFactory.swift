//
//  PixelBufferFactory.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import UIKit
import AVFoundation

final class PixelBufferFactory {
    
    // MARK: - Public

    static func pixelBufferFromImage(image: UIImage,
                                     pixelBufferPool: CVPixelBufferPool,
                                     renderSettings: VideoGenerationConfiguration) -> CVPixelBuffer? {
        guard let pixelBuffer = createPixelBuffer(for: pixelBufferPool) else {
            return nil
        }
        
        let size = renderSettings.size
        let lockFlags = CVPixelBufferLockFlags(rawValue: 0)
        CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags)
        
        if let context = createCGContext(size: size, pixelBuffer: pixelBuffer),
           let cgImage = image.cgImage {
            context.clear(.init(origin: .zero, size: size))
            let imageRect = calculateImageRect(image: image, contextSize: size)
            context.draw(cgImage, in: imageRect)
            CVPixelBufferUnlockBaseAddress(pixelBuffer, lockFlags)
            return pixelBuffer
        } else {
            CVPixelBufferUnlockBaseAddress(pixelBuffer, lockFlags)
            return nil
        }
    }
    
    // MARK: - Private
    
    private static func createPixelBuffer(for pool: CVPixelBufferPool) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault, pool, &pixelBuffer)
        if status != kCVReturnSuccess {
            return nil
        }
        return pixelBuffer
    }
    
    private static func createCGContext(size: CGSize, pixelBuffer: CVPixelBuffer) -> CGContext? {
        .init(data: CVPixelBufferGetBaseAddress(pixelBuffer),
              width: Int(size.width),
              height: Int(size.height),
              bitsPerComponent: 8,
              bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
              space: CGColorSpaceCreateDeviceRGB(),
              bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
    }
    
    private static func calculateImageRect(image: UIImage, contextSize: CGSize) -> CGRect {
        let horizontalRatio = contextSize.width / image.size.width
        let verticalRatio = contextSize.height / image.size.height
        let aspectRatio = min(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: image.size.width * aspectRatio, height: image.size.height * aspectRatio)
        
        let x = newSize.width < contextSize.width ? (contextSize.width - newSize.width) / 2 : 0
        let y = newSize.height < contextSize.height ? (contextSize.height - newSize.height) / 2 : 0
        
        return .init(origin: .init(x: x, y: y), size: newSize)
    }
}

