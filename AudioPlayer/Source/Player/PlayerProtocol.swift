import Foundation

public protocol PlayerProtocol:AnyObject {
    var delegate:PlayerDelegate? { get set }
    
    func play()
    func setUri(uri:String)
}
