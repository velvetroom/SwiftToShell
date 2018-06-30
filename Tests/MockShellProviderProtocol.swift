import Foundation
@testable import SwiftToShell

class MockShellProviderProtocol:ShellProviderProtocol {
    var returnMessage:String
    
    init() {
        self.returnMessage = String()
    }
    
    func send(message:String) -> String {
        return self.returnMessage
    }
}
