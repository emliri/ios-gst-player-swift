import Foundation

public class Factory {
    static var monostate:PlayerProtocol = Player()
    public class func makePlayer() -> PlayerProtocol { return monostate }
    class func makeProvider() -> ProviderProtocol { return Gstreamer() as! ProviderProtocol }
    
    private init() { }
}
