import Foundation

class StateNone:StateProtocol {
    let value:PlayerState
    
    init() {
        self.value = PlayerState.none
    }
    
    func play(player:Player) throws {
        guard
            let url:String = player.media.url
        else { throw PlayerError.sourceNotSet }
        player.provider.setSource(url:url)
        player.provider.play()
        player.delegate?.playerStatusPlaying()
        player.state = State.playing
    }
    
    func pause(player:Player) throws { throw PlayerError.canNotPause }
}
