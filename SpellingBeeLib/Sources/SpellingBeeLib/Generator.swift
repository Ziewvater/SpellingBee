//
//  Generator.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

struct Generator {
    
    static func combinations(of letters: [String], withPrefix prefix: String? = nil, ofLength length: Int) -> [String] {
        
        if let prefix = prefix {
            // Edge cases: prefix is long enough that remaining letters are just paired
            if prefix.count == length - 1 {
                return letters.map { prefix + $0 }
            }
        } else if length == 1 {
            // Length of combinations is just 1, return input
            return letters
        }
        
        if let prefix = prefix {
            let newPrefices = letters.compactMap { letter -> (String, [String]) in
                guard let index = letters.lastIndex(of: letter) else {
                    print("Error creating reduced data sources. New prefix suffix not found in input.")
                    return ("", [""])
                }
                let newSource = Array(letters.suffix(from: index + 1))
                return (letter, newSource)
            }.filter { (pair) -> Bool in
                let (letter, newSource) = pair
                return prefix.count + letter.count + newSource.count >= length
            }
            
            return newPrefices.map { pair -> [String] in
                let (letter, newSource) = pair
                return combinations(of: newSource, withPrefix: prefix + letter, ofLength: length)
            }.reduce([], +)
        } else {
            let nextSource = Array(letters.suffix(from: 1))
            let prefixedCombinations = combinations(of: Array(letters.suffix(from: 1)), withPrefix: letters[0], ofLength: length)
            if nextSource.count >= length {
                let reducedSourceCombinations = combinations(of: Array(letters.suffix(from: 1)), withPrefix: nil, ofLength: length)
                return prefixedCombinations + reducedSourceCombinations
            } else {
                return prefixedCombinations
            }
        }
    }
}
