//
//  FileExtensionUtils.swift
//  pmtest
//
//  Created by Aram Sargsyan on 28.01.22.
//

import UniformTypeIdentifiers
import MobileCoreServices
import AVFoundation

struct UTTypeProvider {
    
    static func provideGifUTTypeIdentifier() -> CFString {
        let utTypeGif: CFString
        if #available(iOS 14.0, *) {
            utTypeGif = UTType.gif.identifier as CFString
        } else {
            utTypeGif = kUTTypeGIF
        }
        return utTypeGif
    }
}

struct AVFileTypeProvider {
    
    static func provideMp4AVFileType() -> AVFileType {
        AVFileType.mp4
    }
}

struct FileExtensionProvider {
    
    static func provideFileExtension(utTypeIdentifier: CFString) -> String? {
        if #available(iOS 14.0, *) {
            return UTType(utTypeIdentifier as String)?.preferredFilenameExtension
        } else {
            let preferredTag = UTTypeCopyPreferredTagWithClass(utTypeIdentifier as CFString, kUTTagClassFilenameExtension)
            let extractedExtension = preferredTag?.takeRetainedValue() as Optional<String>
            return extractedExtension
        }
    }
    
    static func provideFileExtension(avFileType: AVFileType) -> String? {
        provideFileExtension(utTypeIdentifier: avFileType.rawValue as CFString)
    }
}
