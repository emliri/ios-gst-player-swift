import Foundation

class StatePlaying:StateProtocol {
    let value:State
    
    init() {
        self.value = State.playing
    }
    
    func addToPlay(context:Player, list:[String]) {
        context.list.append(contentsOf:list)
    }
    
    func clearList(context:Player) {
        context.playerStop()
    }
    
    func pause(context:Player) throws {
        context.provider.pause()
        context.delegate?.playerStatusPaused()
        context.state = States.paused
    }
    
    func stop(context:Player) throws {
        context.playerStop()
    }
    
    func seek(context:Player, seconds:Int) throws {
        context.provider.seek(seconds:seconds)
    }
    
    func play(context:Player) throws { throw PlayerError.alreadyPlaying }
    
    func endOfStream(context:Player) {
        context.provider.stop()
        context.delegate?.playerStatusReady()
        context.state = States.ready
    }
}
