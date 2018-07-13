import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    var media:PlayerMedia { get set }
    var currentState:PlayerState { get }
    
    func play() throws
}
