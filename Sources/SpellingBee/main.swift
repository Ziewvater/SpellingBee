import ArgumentParser

struct SpellingBee : ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Solve the NYT Spelling Bee game.",
        subcommands: [Generate.self])
    
    init() { }
    init(from decoder: Decoder) throws { }

    mutating func run() throws {
        guard let list = WordList() else {
            print("Failed to load word list")
            return
        }
        print("Loaded word list! Has \(list.words.count) words")

        let testWords = ["Hello", "alfalfa", "took", "szn", "tuned", "alksdjf", "123213", "Disney"]
        print("Testing word list with some words")
        testWords.forEach { (word) in
            print("Testing \(word)")
            let isWord = list.isWord(word)
            print("\(word) \(isWord ? "is" : "is not") a word")
        }
    }

}

struct Generate : ParsableCommand {
    
    static let configuration = CommandConfiguration(abstract: "Generate answers for the puzzle with the given letters")
    
    @Argument(help: "Letters in the puzzle, starting with the center letter.")
    private var letters: [String] = []
    
    @Flag(name: .long, help: "Show extra logging for debugging purposes")
    private var verbose: Bool = false
    
    func run() throws {
    }
}

SpellingBee.main()
