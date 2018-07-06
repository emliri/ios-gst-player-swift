import Foundation

@objc protocol PlayerProviderProtocol {
    var delegate:PlayerProviderDelegate? { get set }
    
    init()
    func set(uri:String)
    func play()
}
