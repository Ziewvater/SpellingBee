//
//  Solver.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

/// The Solver can generate lists of possible words for the NYT Spelling Bee puzzle
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
    
    /// Generates a list of potential solutions to the Spelling Bee puzzle for the
    /// given set of letters and key letter (center letter of the puzzle).
    /// Note that the key letter must be included in the first set of letters.
    public func solve(for letters: [String], withKeyLetter keyLetter: String) -> [String] {
        return Generator.combinations(of: letters).filter {
            return $0.contains(keyLetter)
        }.compactMap { (combo) -> [String]? in
            return wordHash.words(for: combo)
        }.reduce([], +)
    }
}
