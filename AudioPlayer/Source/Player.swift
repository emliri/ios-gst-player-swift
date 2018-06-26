import Foundation

public class Player {
    private var player:OpaquePointer?
    
    public init() {
        gst_init(nil, nil)
        self.player = gst_player_new(nil, nil)
        gst_player_play(self.player)
    }

    public func play() {
        
    }
}
