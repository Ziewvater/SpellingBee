//
//  IO.swift
//
//
//  Created by Jeremy Lawrence on 7/22/20.
//

import Foundation

struct IO {
    static let repoDirectoryPath = "/Users/JeremyYL/Developer/SpellingBee"
    static let originalSourcePath = { URL(fileURLWithPath: repoDirectoryPath + "/Sources/SpellingBee/words.txt") }()
    static let updatedSourceDirectoryPath = { URL(fileURLWithPath: repoDirectoryPath + "/generated") }()
    static let updatedSourceName = "updated.txt"

    /// The text of the word list source
    static func source(sourcePath: URL = IO.originalSourcePath) -> String? {
        guard let wordString = try? String(contentsOf: sourcePath, encoding: String.Encoding.utf8) else {
            return nil
        }
        return wordString
    }
    
    static func updateSource(with source: String, to destinationURL: URL = IO.updatedSourceDirectoryPath, named fileName: String = updatedSourceName) throws {
        if !FileManager.default.fileExists(atPath: destinationURL.absoluteString) {
            do {
                try FileManager.default.createDirectory(at: destinationURL, withIntermediateDirectories: true)
            } catch {
                print("Error creating updated source directory:\n\(error)")
            }
        }
        try source.write(to: destinationURL.appendingPathComponent(fileName), atomically: true, encoding: .utf8)
    }
    
    static func updateSource(with wordList: [String]) throws {
        let source = wordList.joined(separator: "\n")
        try updateSource(with: source)
    }
}
