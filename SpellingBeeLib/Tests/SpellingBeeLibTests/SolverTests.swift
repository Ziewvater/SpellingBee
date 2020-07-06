//
//  SolverTests.swift
//  
//
//  Created by Jeremy Lawrence on 7/5/20.
//

import Foundation
import XCTest
@testable import SpellingBeeLib

final class SolverTests: XCTestCase {
    
    //MARK: Basic solving
    
    func testSimpleSolve() {
        let solver = Solver(wordList: ["cab", "yarn", "flock"])
        let answers = solver?.solve(for: ["a", "b", "c"])
        XCTAssertEqual(answers, ["cab"])
    }
    
    func testMultipleSolve() {
        let solver = Solver(wordList: ["cab", "back", "abba", "cacaca"])
        let answers = solver?.solve(for: ["a", "b" , "c"]).sorted()
        XCTAssertEqual(answers, ["cab", "abba", "cacaca"].sorted())
    }
    
    func testWeirdMultipleSolves() {
        let solver = Solver(wordList: ["a" , "aaaaaaaaaa", "b", "babababa", "bac"])
        let answers = solver?.solve(for: ["a", "b"]).sorted()
        XCTAssertEqual(answers, ["a", "aaaaaaaaaa", "b", "babababa"].sorted())
    }
    
    //MARK: Key letter tests
    
    func testKeyLetterSolve() {
        let solver = Solver(wordList: ["cab", "back", "abba", "cacaca"])
        let answers = solver?.solve(for: ["a", "b" , "c"], withKeyLetter: "b").sorted()
        XCTAssertEqual(answers, ["cab", "abba"].sorted())
    }
}
