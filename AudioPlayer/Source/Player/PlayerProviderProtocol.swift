import Foundation

@objc protocol PlayerProviderProtocol {
    init()
    func set(uri:String)
    func play()
}
