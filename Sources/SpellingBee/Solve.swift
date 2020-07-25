//
//  Solve.swift
//  SpellingBee
//
//  Created by Jeremy Lawrence on 7/24/20.
//

import Foundation
import ArgumentParser
import SpellingBeeLib

struct Solve: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "solve",
        abstract: "Solve the puzzle for a set of letters")

    @Argument(help: "Letters in the puzzle, starting with the center letter.")
    private var letters: String

    func validate() throws {
        guard letters.count == 7 else {
            throw ValidationError("Spelling Bee puzzles always have 7 letters.")
        }
    }

    init() { }

    mutating func run() throws {
        guard let keyCharacter = letters.first else {
            print("Error: no key letter found, input too short: \(letters)")
            return
        }

        guard let solver = Solver() else {
            print("Error: unable to create Solver")
            return
        }

        let splitLetters: [String] = Array(letters).map { String($0) }
        let answers = solver.solve(for: splitLetters, withKeyLetter: String(keyCharacter))
            .filter { $0.count >= 4 }
            .sorted { (str1, str2) -> Bool in
                if str1.count == str2.count {
                    return str1.first! < str2.first!
                } else {
                    return str1.count > str2.count
                }
        }
        guard answers.count > 0 else {
            print("Unable to find any long enough answers")
            return
        }
        print("Answers for letter group: \(letters)")
        answers.forEach { print($0) }
    }
}
