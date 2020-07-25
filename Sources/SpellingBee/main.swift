import ArgumentParser
import SpellingBeeLib

struct SpellingBee : ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "spelling-bee",
        abstract: "Tool to solve the NYT Spelling Bee game. Can be trained to return better results based off actual NYT wordlist results.",
        subcommands: [Solve.self])
}

SpellingBee.main()
