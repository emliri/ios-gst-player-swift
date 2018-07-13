import Foundation

@objc protocol ProviderProtocol {
    var delegate:ProviderDelegate? { get set }

    func setSource(url:String)
    func play()
    func pause()
}
