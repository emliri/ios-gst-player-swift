import Foundation

class StatePaused:StateProtocol {
    let value:PlayerState
    
    init() {
        self.value = PlayerState.paused
    }
    
    func play(player:Player) throws {
        player.provider.play()
        player.delegate?.playerStatusPlaying()
        player.state = State.playing
    }
    
    func pause(player:Player) throws { throw PlayerError.canNotPause }
}
