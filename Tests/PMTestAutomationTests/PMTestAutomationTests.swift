import XCTest
@testable import PMTestAutomation

final class PMTestAutomationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PMTestAutomation().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
