import Foundation

class StateStopped:StateProtocol {
    let value:State
    
    init() {
        self.value = State.stopped
    }
    
    func setSource(player:Player, url:String) {
        player.provider.setSource(url:url)
        player.delegate?.playerStatusReady()
        player.state = States.ready
    }
    
    func play(player:Player) throws { throw PlayerError.sourceNotSet }
    func pause(player:Player) throws { throw PlayerError.canNotPause }
    func stop(player:Player) throws { throw PlayerError.canNotStop }
    func seek(player:Player, seconds:Float) throws { throw PlayerError.canNotSeek }
}
