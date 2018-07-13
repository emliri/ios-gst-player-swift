import Foundation

@objc protocol ProviderProtocol {
    var delegate:ProviderDelegate? { get set }
    
    func set(uri:String)
    func play()
}
