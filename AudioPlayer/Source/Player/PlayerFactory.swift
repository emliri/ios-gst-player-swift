import Foundation

public class PlayerFactory {
    static var monostatePlayer:PlayerProtocol = Player()
    public class func makePlayer() -> PlayerProtocol { return monostatePlayer }
    
    private init() { }
}
