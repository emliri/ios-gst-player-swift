import Foundation

class StatePlaying:StateProtocol {
    let value:State
    
    init() {
        self.value = State.playing
    }
    
    func setSource(player:Player, url:String) {
        player.provider.stop()
        player.provider.setSource(url:url)
        player.delegate?.playerStatusReady()
        player.state = States.ready
    }
    
    func play(player:Player) throws { throw PlayerError.alreadyPlaying }
    
    func pause(player:Player) throws {
        player.provider.pause()
        player.delegate?.playerStatusPaused()
        player.state = States.paused
    }
    
    func stop(player:Player) throws {
        player.provider.stop()
        player.delegate?.playerStatusStopped()
        player.state = States.stopped
    }
}
