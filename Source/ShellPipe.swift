import Foundation

class ShellPipe {
    let pipe:Pipe
    
    init() {
        self.pipe = Pipe()
    }
    
    func read() -> String {
        let data:Data = self.pipe.fileHandleForReading.readDataToEndOfFile()
        guard
            let string:String = String(data:data, encoding:String.Encoding.utf8)
        else { return String() }
        return string
    }
}
