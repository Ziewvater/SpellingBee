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
    
    static var allTests = [
        ("testSingleWord", testSingleWord),
        ("testTwoWords", testTwoWords),
        ("testTwoDifferentWords", testTwoDifferentWords),
        ("testTwoSetsOfDifferentWords", testTwoSetsOfDifferentWords),
    ]
}
