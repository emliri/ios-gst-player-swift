import Foundation

class StateReady:StateProtocol {
    let value:State
    
    init() {
        self.value = State.ready
    }
    
    func setSource(context:Player, url:String) {
        context.provider.setSource(url:url)
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
    
    func pause(context:Player) throws { throw PlayerError.canNotPause }
    func seek(context:Player, seconds:Int) throws { throw PlayerError.canNotSeek }
}
