import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    var currentState:State { get }
    var list:[String] { get }
    
    func addToPlay(list:[String])
    func clearList()
    func play() throws
    func pause() throws
    func stop() throws
    func seek(seconds:Float) throws
    func next() throws
    func previous() throws
}
