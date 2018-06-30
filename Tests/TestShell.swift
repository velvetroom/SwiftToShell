import XCTest
@testable import SwiftToShell

class TestShell:XCTestCase {
    private var model:Shell!
    private var provider:MockShellProviderProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Shell()
        self.provider = MockShellProviderProtocol()
        self.model.provider = self.provider
    }
    
    func testEmptyMessage() {
        let response:String = self.model.send(message:String())
        XCTAssertEqual(response, String(), "Invalid response")
    }
    
    func testCleanNewLineIfLast() {
        self.provider.returnMessage = "\n"
        let response:String = self.model.send(message:String())
        XCTAssertEqual(response, String(), "Invalid response")
    }
    
    func testCleanNewLineButKeepContent() {
        let expectedResponse:String = "hello world"
        self.provider.returnMessage = "\(expectedResponse)\n"
        let response:String = self.model.send(message:String())
        XCTAssertEqual(response, expectedResponse, "Invalid response")
    }
    
    func testKeepLineBreaks() {
        let expectedResponse:String = "lorem\nipsum\ndolet"
        self.provider.returnMessage = expectedResponse
        let response:String = self.model.send(message:String())
        XCTAssertEqual(response, expectedResponse, "Invalid response")
    }
    
    func testKeepLineBreaksButRemoveLastIfFound() {
        let expectedResponse:String = "lorem\nipsum\ndolet"
        self.provider.returnMessage = "\(expectedResponse)\n"
        let response:String = self.model.send(message:String())
        XCTAssertEqual(response, expectedResponse, "Invalid response")
    }
}
