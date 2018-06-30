import Foundation

class StandardShell:ShellProviderProtocol {
    func send(message:String) -> String {
        let pipe:ShellPipe = ShellPipe()
        let process:ShellProcess = ShellProcess()
        process.arguments = message
        process.output = pipe
        process.run()
        return pipe.read()
    }
}
