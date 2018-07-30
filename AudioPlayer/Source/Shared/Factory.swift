import Foundation

public class Factory {
    public class func makePlayer() -> PlayerProtocol { return monostate }
    class func makeProvider() -> ProviderProtocol { return Gstreamer() as! ProviderProtocol }
    
    static let monostate:PlayerProtocol = Player()
    
    private init() { }
}
