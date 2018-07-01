import Foundation

class ShellProcess {
    var arguments:String {
        get {
            return String()
        }
        set(newValue) {
            self.process.arguments = newValue.components(separatedBy:SwiftToShellConstants.separator)
        }
    }
    
    var output:ShellPipe? {
        get {
            return self.process.standardOutput as? ShellPipe
        }
        set(newValue) {
            self.process.standardOutput = newValue?.pipe
        }
    }
    
    private let process:Process
    
    init() {
        self.process = Process()
        self.configureProcess()
    }
    
    func run() {
        do {
            try self.process.run()
        } catch { return }
        self.process.waitUntilExit()
    }
    
    private func configureProcess() {
        self.process.executableURL = URL(fileURLWithPath:SwiftToShellConstants.environment)
        self.process.environment = [SwiftToShellConstants.encodingKey : SwiftToShellConstants.encodingValue,
                                    SwiftToShellConstants.homeKey : NSHomeDirectory()]
    }
}
