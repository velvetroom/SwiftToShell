import Foundation

public class Shell {
    var provider:ShellProviderProtocol
    
    public init() {
        self.provider = StandardShell()
    }
    
    public func send(message:String) -> String {
        var response:String = self.provider.send(message:message)
        response = self.clean(string:response)
        return response
    }
    
    private func clean(string:String) -> String {
        var string:String = string
        if let last:Character = string.last {
            if String(last) == Constants.newLine {
                string = String(string.dropLast())
            }
        }
        return string
    }
}
