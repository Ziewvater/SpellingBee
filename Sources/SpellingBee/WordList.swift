//
//  WordList.swift
//  
//
//  Created by Jeremy Lawrence on 7/3/20.
//

import Foundation

struct WordList {
    
    var words: [String]
    var hashed: Set<String>
    
    init?() {
        do {
            let wordString = try String(contentsOfFile: "/Users/JeremyYL/Developer/SpellingBee/Sources/SpellingBee/words.txt", encoding: String.Encoding.utf8)
            let splitWords = wordString.split(whereSeparator: \.isNewline)
            self.words = splitWords.map { String($0).lowercased() }
            hashed = Set(words)

        } catch {
            print("Error creating word list: \(error)")
            return nil
        }
    }
    
    func isWord(_ word: String) -> Bool {
        return hashed.contains(word.lowercased())
    }
}
