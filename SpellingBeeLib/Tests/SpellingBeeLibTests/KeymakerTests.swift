//
//  KeymakerTests.swift
//
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation
import XCTest
@testable import SpellingBeeLib

final class KeymakerTests: XCTestCase {
    func testSingleLetter() {
        let string = "a"
        let key = Keymaker.key(for: string)
        XCTAssertEqual(key, "a")
    }
    
    func testTwoLetters() {
        let string = "ab"
        let key = Keymaker.key(for: string)
        XCTAssertEqual(key, "ab")
    }
    
    func testReversedTwoLetters() {
        let string = "ba"
        let key = Keymaker.key(for: string)
        XCTAssertEqual(key, "ab")
    }
    
    func testLongerWord() {
        let string = "acdebgf"
        let key = Keymaker.key(for: string)
        XCTAssertEqual(key, "abcdefg")
    }
    
    func testDuplicates() {
        let string = "aaaabbbbccccdddeef"
        let key = Keymaker.key(for: string)
        XCTAssertEqual(key, "abcdef")
    }
    
    static var allTests = [
        ("testSingleLetter", testSingleLetter),
        ("testTwoLetter", testTwoLetters),
        ("testReversedTwoLetters", testReversedTwoLetters),
        ("testLongerWord", testLongerWord),
        ("testDuplicates", testDuplicates),
    ]
}
