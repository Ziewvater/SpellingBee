//
//  GeneratorTests.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation
import XCTest
@testable import SpellingBeeLib

final class GeneratorTests: XCTestCase {
    
    func testLengthOfOneGeneration() {
        let input = (1...3).map { String($0) }
        let combos = Generator.combinations(of: input, ofLength: 1)
        XCTAssertEqual(combos, ["1", "2", "3"])
    }
    
    func testTwoLengthGeneration() {
        let input = (1...3).map { String($0) }
        let combos = Generator.combinations(of: input, ofLength: 2).sorted()
        XCTAssertEqual(combos, ["12", "13", "23"].sorted())
    }
    
    func testThreeLengthGeneration() {
        let input = (1...4).map { String($0) }
        let combos = Generator.combinations(of: input, ofLength: 3).sorted()
        let expected = ["123", "124", "134", "234"].sorted()
        XCTAssertEqual(combos, expected)
    }
    
    func testEqualInputAndOutputLengthGeneration() {
        let input = (1...3).map { String($0) }
        let combos = Generator.combinations(of: input, ofLength: 3)
        XCTAssertEqual(combos, ["123"])
    }
}
