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
    
    func seek(player:Player, seconds:Float) throws {
        player.provider.seek(seconds:seconds)
    }
    
    func play(player:Player) throws { throw PlayerError.alreadyPlaying }
}
