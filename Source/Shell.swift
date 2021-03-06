import Foundation

class Shell:ShellProtocol {
    var provider:ShellProviderProtocol
    
    init() {
        self.provider = StandardShell()
    }
    
    @discardableResult func send(message:String) -> String {
        var response:String = self.provider.send(message:message)
        response = self.clean(string:response)
        return response
    }
    
    private func clean(string:String) -> String {
        var string:String = string
        if let last:Character = string.last {
            if String(last) == SwiftToShellConstants.newLine {
                string = String(string.dropLast())
            }
        }
        return string
    }
}
