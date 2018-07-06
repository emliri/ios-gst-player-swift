import Foundation

class PlayerProviderFactory {
    static var providerType:PlayerProviderProtocol.Type = Gstreamer.self as! PlayerProviderProtocol.Type
    
    class func makeProvider() -> PlayerProviderProtocol {
        return providerType.init()
    }
    
    private init() { }
}
