import Foundation

public class Shell {
    private let pipe:Pipe
    
    public init() {
        self.pipe = Pipe()
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
