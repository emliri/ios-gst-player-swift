import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    var currentState:State { get }
    
    func setSource(url:String)
    func play() throws
    func pause() throws
    func stop() throws
    func seek(seconds:Float) throws
}
