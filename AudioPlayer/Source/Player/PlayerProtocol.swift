import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    var media:PlayerMedia { get }
    var currentState:PlayerState { get }
    
    func setSource(url:String) throws
    func removeSource()
    func play() throws
    func pause() throws
}
