//
// WordHashTests.swift
//
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation
import XCTest
@testable import SpellingBeeLib

final class WordHashTests: XCTestCase {
    
    // MARK: Membership
    
    func testSingleWord() {
        let hash = WordHash(wordList: ["cab"])
        let expected = ["abc": ["cab"]]
        XCTAssertEqual(hash.record, expected)
    }
    
    func testTwoWords() {
        let hash = WordHash(wordList: ["cab", "bac"])
        let expected = ["abc": ["cab", "bac"]]
        XCTAssertEqual(hash.record, expected)
    }
    
    func testTwoDifferentWords() {
        let hash = WordHash(wordList: ["cab", "back"])
        let expected = [
            "abc": ["cab"],
            "abck": ["back"],
            ]
        XCTAssertEqual(hash.record, expected)
    }
    
    func testTwoSetsOfDifferentWords() {
        let hash = WordHash(wordList: ["cab", "bac", "back", "kback"])
        let expected = [
            "abc": ["cab", "bac"],
            "abck": ["back", "kback"],
        ]
        XCTAssertEqual(hash.record, expected)
    }
    
    func testMembership() {
        let word = "cat"
        let hash = WordHash(wordList: [word])
        XCTAssertTrue(hash.determineMembership(of: word))
    }
    
    func testNotMember() {
        let word = "cat"
        let notMember = "bag"
        let hash = WordHash(wordList: [word])
        XCTAssertFalse(hash.determineMembership(of: notMember))
    }
    
    // MARK: Learning
    
    func testSingleLearning() {
        let word = "cat"
        var hash = WordHash(wordList: [])
        hash.learn(word: word)
        let words = hash.words(for: Keymaker.key(for: word))
        let expected = [word]
        XCTAssertEqual(words, expected)
    }
    
    func testDoubleLearning() {
        let word1 = "cat"
        let word2 = "act"
        var hash = WordHash(wordList: [])
        hash.learn(word: word1)
        hash.learn(word: word2)
        let words = hash.words(for: Keymaker.key(for: word1))?.sorted()
        let expected = [word1, word2].sorted()
        XCTAssertEqual(words, expected)
    }
    
    func testSeparateDoubleLearning() {
        let word1 = "cat"
        let word2 = "wheat"
        var hash = WordHash(wordList: [])
        hash.learn(word: word1)
        hash.learn(word: word2)
        let words = [word1, word2].compactMap {
            hash.words(for: Keymaker.key(for: $0))
        }.reduce([], +)
            .sorted()
        let expected = [word1, word2].sorted()
        XCTAssertEqual(words, expected)
    }
    
    // MARK: Forgetting
    
    func testForgettingWord() {
        let word = "cat"
        var hash = WordHash(wordList: [])
        hash.learn(word: word)
        XCTAssertTrue(hash.determineMembership(of: word))
        
        hash.forget(word: word)
        XCTAssertFalse(hash.determineMembership(of: word))
    }
    
    // MARK: Source Dumping
    
    func testSingleSource() {
        let word = "cat"
        let hash = WordHash(wordList: [word])
        XCTAssertEqual(hash.sourceWords(), [word])
    }
    
    func testDoubleSource() {
        let words = ["cat", "barf"]
        let hash = WordHash(wordList: words)
        XCTAssertEqual(hash.sourceWords(), words.sorted())
    }
    
    func testLongSource() {
        let words = ["cat", "barf", "homely", "Computer", "plastic"]
        let hash = WordHash(wordList: words)
        XCTAssertEqual(hash.sourceWords(), words.sorted())
    }
    
    static var allTests = [
        ("testSingleWord", testSingleWord),
        ("testTwoWords", testTwoWords),
        ("testTwoDifferentWords", testTwoDifferentWords),
        ("testTwoSetsOfDifferentWords", testTwoSetsOfDifferentWords),
        ("testMembership", testMembership),
        ("testNotMember", testNotMember),
        ("testSingleLearning", testSingleLearning),
        ("testDoubleLearning", testDoubleLearning),
        ("testSeparateDoubleLearning", testSeparateDoubleLearning),
        ("testForgettingWord", testForgettingWord),
        ("testSingleSource", testSingleSource),
        ("testDoubleSource", testDoubleSource),
        ("testLongSource", testLongSource),
    ]
}
