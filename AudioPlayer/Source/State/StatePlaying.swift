import Foundation

class StatePlaying:StateProtocol {
    let value:State
    
    init() {
        self.value = State.playing
    }
    
    func setSource(context:Player, url:String) {
        context.provider.stop()
        context.provider.setSource(url:url)
        context.delegate?.playerStatusReady()
        context.state = States.ready
    }
    
    func pause(context:Player) throws {
        context.provider.pause()
        context.delegate?.playerStatusPaused()
        context.state = States.paused
    }
    
    func stop(context:Player) throws {
        context.provider.stop()
        context.delegate?.playerStatusStopped()
        context.state = States.stopped
    }
    
    func seek(context:Player, seconds:Int) throws {
        context.provider.seek(seconds:seconds)
    }
    
    func play(context:Player) throws { throw PlayerError.alreadyPlaying }
    
    func endOfStream(context:Player) {
        context.provider.stop()
        context.delegate?.playerStatusStopped()
        context.state = States.stopped
    }
}
