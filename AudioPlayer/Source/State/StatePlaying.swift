import Foundation

class StatePlaying:StateProtocol {
    let value:PlayerState
    
    init() {
        self.value = PlayerState.playing
    }
    
    func pause(player:Player) throws {
        player.provider.pause()
        player.delegate?.playerStatusPaused()
        player.state = State.paused
    }
}
