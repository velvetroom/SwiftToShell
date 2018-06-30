import Foundation

public class Shell {
    private let pipe:PipeA
    
    public init() {
        self.pipe = Pipe()
    }
    
    public func execute(input:String) -> String {
        let process:Process = self.makeProcessWith(input:input)
        process.launch()
        process.waitUntilExit()
        return self.readFromPipe()
    }
    
    private func makeProcessWith(input:String) -> Process {
        let process:Process = Process()
        process.standardOutput = self.pipe
        process.launchPath = Constants.environment
        process.arguments = self.makeArgumentsFrom(input:input)
        process.environment = [Constants.encodingKey : Constants.encodingValue,
                               Constants.homeKey : NSHomeDirectory()]
        return process
    }
    
    private func makeArgumentsFrom(input:String) -> [String] {
        return input.split(separator:Constants.separator).map { (substring:Substring) -> String in
            return String(substring)
        }
    }
    
    private func readFromPipe() -> String {
        let data:Data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard
            let string:String = String(data:data, encoding:String.Encoding.utf8)
        else { return String() }
        let cleaned:String = self.clean(string:string)
        return cleaned
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
