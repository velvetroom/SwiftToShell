import XCTest
@testable import SwiftToShell

class TestStandardShell:XCTestCase {
    private var model:StandardShell!
    
    override func setUp() {
        super.setUp()
        self.model = StandardShell()
    }
    
    func testSendMessageReturnsResponse() {
        let innerMessage:String = "hello world"
        let expectedResponse:String = "\(innerMessage)\n"
        let message:String = "echo \(innerMessage)"
        let response:String = self.model.send(message:message)
        XCTAssertEqual(expectedResponse, response, "Failed to return message")
    }
    
    func testSendMessageEmpty() {
        let message:String = " "
        let response:String = self.model.send(message:message)
        XCTAssertEqual(String(), response, "Failed to return message")
    }
}
