//
//  Solver.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

public struct Solver {
    
    private let wordHash: WordHash
    
    init?(wordList: [String]? = nil) {
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
        let combinations = Generator.combinations(of: letters)
        return combinations.compactMap { (combo) -> [String]? in
            return wordHash.words(for: combo)
        }.reduce([], +)
    }
}
