//
//  WordHash.swift
//
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

/// The WordHash creates a quick reference for words, keyed by the letters that are
/// members of the word.
public struct WordHash {
    
    var record: [String: [String]]
    
    public init(wordList: [String]) {
        record = WordHash.createHash(with: wordList)
    }
    
    private static func createHash(with list: [String]) -> [String: [String]] {
        return zip(list.map { Keymaker.key(for: $0) }, list).reduce(into: [:]) { (dict: inout [String: [String]], pair) in
            let (key, word) = pair
            if var entry = dict[key] {
                entry.append(word)
                dict[key] = entry
            } else {
                dict[key] = [word]
            }
        }
    }
    
    public func determineMembership(of word: String) -> Bool {
        if let members = words(for: Keymaker.key(for: word)) {
            return !members.isEmpty
        } else {
            return false
        }
    }
    
    public func words(for key: String) -> [String]? {
        return record[Keymaker.key(for: key)]
    }
    
    mutating func learn(word: String) {
        modifyRecord(for: word) { entry -> [String] in
            return entry + [word]
        }

    }
    
    mutating func forget(word: String) {
        modifyRecord(for: word) { entry -> [String] in
            return entry.filter { word != $0 }
        }
    }
    
    mutating private func modifyRecord(for word: String, with edit: (([String]) -> [String])) {
        let key = Keymaker.key(for: word)
        let entry = words(for: key) ?? []
        let edited = edit(entry)
        record[key] = edited
    }
}

extension WordHash {
    
    public func sourceWords() -> [String]? {
        return record.compactMap { $0.value }.joined().map { $0 }.sorted()
    }

}
