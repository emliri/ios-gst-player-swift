import Foundation

public class PlayerFactory {
    static var monoStatePlayer:PlayerProtocol = Player()
    public class func makePlayer() -> PlayerProtocol { return monoStatePlayer }
    
    private init() { }
}
