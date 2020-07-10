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
    
    public func words(for key: String) -> [String]? {
        return record[Keymaker.key(for: key)]
    }
    
    mutating func learn(word: String) {
        let key = Keymaker.key(for: word)
        if var entry = words(for: key) {
            entry.append(word)
            record[key] = entry
        } else {
            record[key] = [word]
        }
    }
}
