import Foundation

@objc protocol ProviderProtocol {
    var delegate:ProviderDelegate? { get set }

    func setSource(url:String)
    func removeSource()
    func play()
    func pause()
}
