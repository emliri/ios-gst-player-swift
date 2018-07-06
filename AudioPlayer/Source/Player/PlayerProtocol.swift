import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    
    func setUri(uri:String)
    func play()
}
