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
        abstract: "Train the data source",
        subcommands: [Forget.self, Learn.self])
}

struct Forget: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "forget",
        abstract: "Teach the wordlist to forget words")

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

struct Learn: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "learn",
        abstract: "Teach the wordlist to start suggesting words")

    @Argument(help: "Words to learn")
    private var words: [String] = []

    init() { }

    mutating func run() throws {
        print("Learning \(words.joined(separator: ", "))")
        guard var teacher = Teacher() else {
            print("Error initializing data source.")
            return
        }
        try teacher.learn(words: words)
        print("Learned!")
    }
}
