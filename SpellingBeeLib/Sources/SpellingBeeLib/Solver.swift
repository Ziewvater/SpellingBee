//
//  Solver.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

public struct Solver {
    
    private let wordHash: WordHash
    
    public init?(wordList: [String]? = nil) {
        guard let list: [String] = {
            if let wordList = wordList {
                return wordList
            } else {
                return WordList()?.words
            }
            }() else {
                print("Error creating Solver: either no word list provided or unable to create new word list")
                return nil
        }
        
        wordHash = WordHash(wordList: list)
    }
    
    public func solve(for letters: [String]) -> [String] {
        return Generator.combinations(of: letters).compactMap { (combo) -> [String]? in
            return wordHash.words(for: combo)
        }.reduce([], +)
    }
    
    public func solve(for letters: [String], withKeyLetter keyLetter: String) -> [String] {
        return Generator.combinations(of: letters).filter {
            return $0.contains(keyLetter)
        }.compactMap { (combo) -> [String]? in
            return wordHash.words(for: combo)
        }.reduce([], +)
    }
}
