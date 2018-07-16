import Foundation

class StateReady:StateProtocol {
    let value:State
    
    init() {
        self.value = State.ready
    }
    
    func setSource(player:Player, url:String) {
        player.provider.setSource(url:url)
    }
    
    func pause(player:Player) throws { throw PlayerError.canNotPause }
    
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
}
