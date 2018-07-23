import Foundation

class StatePaused:StateProtocol {
    let value:State
    
    init() {
        self.value = State.paused
    }
    
    func setSource(player:Player, url:String) {
        player.provider.stop()
        player.provider.setSource(url:url)
        player.delegate?.playerStatusReady()
        player.state = States.ready
    }
    
    func play(player:Player) throws {
        player.provider.play()
        player.delegate?.playerStatusPlaying()
        player.state = States.playing
    }
    
    func stop(player:Player) throws {
        player.provider.stop()
        player.delegate?.playerStatusStopped()
        player.state = States.stopped
    }
    
    func seek(player:Player, seconds:Int) throws {
        player.provider.seek(seconds:seconds)
    }
    
    func pause(player:Player) throws { throw PlayerError.canNotPause }
}
