import Foundation

public protocol ShellProtocol:class {
    func send(message:String) -> String
}
