import Foundation

@objc protocol PlayerProviderProtocol {
    func set(uri:String)
    func play()
}
