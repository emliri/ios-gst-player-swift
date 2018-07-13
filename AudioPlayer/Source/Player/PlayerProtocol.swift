import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    var state:PlayerState { get }
    
    func play()
    func setUri(uri:String)
}
