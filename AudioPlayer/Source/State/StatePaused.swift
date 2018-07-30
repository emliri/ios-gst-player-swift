import Foundation

class StatePaused:StateProtocol {
    let value:State
    
    init() {
        self.value = State.paused
    }
    
    func setSource(context:Player, url:String) {
        context.provider.stop()
        context.provider.setSource(url:url)
        context.delegate?.playerStatusReady()
        context.state = States.ready
    }
    
    func play(context:Player) throws {
        context.provider.play()
        context.delegate?.playerStatusPlaying()
        context.state = States.playing
    }
    
    func stop(context:Player) throws {
        context.provider.stop()
        context.delegate?.playerStatusStopped()
        context.state = States.stopped
    }
    
    func seek(context:Player, seconds:Int) throws {
        context.provider.seek(seconds:seconds)
    }
    
    func pause(context:Player) throws { throw PlayerError.canNotPause }
}
