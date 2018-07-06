import Foundation

public class PlayerFactory {
    public class func makePlayer() -> PlayerProtocol {
        return Player()
    }
    
    private init() { }
}
