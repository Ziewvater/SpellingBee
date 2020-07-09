//
//  WordHash.swift
//
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

public struct WordHash {
    
    var record: [String: [String]]
    
    init(wordList: [String]) {
        record = WordHash.createHash(with: wordList)
    }
    
    static func createHash(with list: [String]) -> [String: [String]] {
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
    
    func words(for key: String) -> [String]? {
        return record[Keymaker.key(for: key)]
    }
}
