import Foundation

public protocol ShellProtocol:class {
    @discardableResult func send(message:String) -> String
}
