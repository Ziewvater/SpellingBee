//
//  Train.swift
//  SpellingBee
//
//  Created by Jeremy Lawrence on 7/23/20.
//

import Foundation
import ArgumentParser
import SpellingBeeLib

struct Train: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "train",
        abstract: "Train the data source")

    @Argument(help: "Words to forget")
    private var words: [String] = []

    init() { }

    mutating func run() throws {
        print("Forgetting \(words.joined(separator: ", "))")
        guard var teacher = Teacher() else {
            print("Error initializing data source.")
            return
        }
        try teacher.forget(words: words)
        print("Forgotten.")
    }
}
