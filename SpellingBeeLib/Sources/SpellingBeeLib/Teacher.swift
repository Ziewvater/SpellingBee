//
//  Teacher.swift
//
//
//  Created by Jeremy Lawrence on 7/23/20.
//

import Foundation

public struct Teacher {

    var wordHash: WordHash

    public init?() {
        guard let wordList = WordList() else {
            return nil
        }
        self.wordHash = WordHash(wordList: wordList.words)
    }

    // MARK: Forget

    public mutating func forget(word: String) throws {
        wordHash.forget(word: word)
        try wordHash.save()
    }

    public mutating func forget(words: [String]) throws {
        words.forEach { wordHash.forget(word: $0) }
        try wordHash.save()
    }

    // MARK: Learn

    public mutating func learn(word: String) throws {
        wordHash.learn(word: word)
        try wordHash.save()
    }

    public mutating func learn(words: [String]) throws {
        words.forEach { wordHash.learn(word: $0) }
        try wordHash.save()
    }
}
