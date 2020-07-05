//
//  Keymaker.swift
// 
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation

struct Keymaker {
    
    /// Creates and returns a cache key for the given string
    public static func key(for word: String) -> String {
        return Keymaker.uniqueLetters(for: word).map { String($0) }.joined()
    }

    /// Finds the unique letters of a given string and returns them in a list
    public static func uniqueLetters(for string: String) -> [Character] {
        let uniqued = Set(Array(string))
        return Array(uniqued).sorted()
    }
}
