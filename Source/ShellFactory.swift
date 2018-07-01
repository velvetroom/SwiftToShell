import Foundation

public class ShellFactory {
    public class func makeShell() -> ShellProtocol {
        return Shell()
    }
    
    private init() { }
}
