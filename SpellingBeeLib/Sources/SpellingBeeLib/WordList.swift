//
//  WordList.swift
//  
//
//  Created by Jeremy Lawrence on 7/3/20.
//

import Foundation

public struct WordList {
    
    public var words: [String]
    var hashed: Set<String>
    
    public init?() {
        guard let wordString = IO.source() else {
            return nil
        }
        let splitWords = wordString.split(whereSeparator: \.isNewline)
        self.words = splitWords.map { String($0).lowercased() }
        hashed = Set(words)
    }
    
    public func isWord(_ word: String) -> Bool {
        return hashed.contains(word.lowercased())
    }
}
