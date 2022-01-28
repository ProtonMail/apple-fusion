//
//  FileManagerUtils.swift
//  pmtest
//
//  Created by Aram Sargsyan on 27.01.22.
//

import Foundation

struct FileManagerUtils {

    static var documentsDirectoryUrl: URL? {
        try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    static func createFolderInDocumentsDirectory(folderName: String) -> URL? {
        guard let directoryUrl = documentsDirectoryUrl?.appendingPathComponent(folderName) else {
            return nil
        }
        try? FileManager.default.createDirectory(atPath: directoryUrl.path, withIntermediateDirectories: true, attributes: nil)
        return directoryUrl
    }
}
