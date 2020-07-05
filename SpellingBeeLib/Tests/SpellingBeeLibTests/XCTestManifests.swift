import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(KeymakerTests.allTests),
        testCase(WordhashTests.allTests),
    ]
}
#endif
