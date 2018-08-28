import Foundation

@objc protocol ProviderProtocol:AnyObject {
    var delegate:ProviderDelegate? { get set }

    func setSource(url:String)
    func play()
    func pause()
    func stop()
    func seek(seconds:CLong)
}
