import ArgumentParser

struct SpellingBee : ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Solve the NYT Spelling Bee game.",
        subcommands: [Generate.self])
    
    init() { }
    init(from decoder: Decoder) throws { }

    mutating func run() throws {
        
    }

}

struct Generate : ParsableCommand {
    
    static let configuration = CommandConfiguration(abstract: "Generate answers for the puzzle with the given letters")
    
    @Argument(help: "Letters in the puzzle, starting with the center letter.")
    private var letters: [String] = []
    
    @Flag(name: .long, help: "Show extra logging for debugging purposes")
    private var verbose: Bool = false
    
    func run() throws {
        if verbose {
            print("Hell world")
        }
    }
}

SpellingBee.main()
