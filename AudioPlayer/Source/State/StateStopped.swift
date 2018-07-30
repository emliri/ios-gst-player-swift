import Foundation

class StateStopped:StateProtocol {
    let value:State
    
    init() {
        self.value = State.stopped
    }
    
    func setSource(context:Player, url:String) {
        context.provider.setSource(url:url)
        context.delegate?.playerStatusReady()
        context.state = States.ready
    }
    
    func play(context:Player) throws { throw PlayerError.sourceNotSet }
    func pause(context:Player) throws { throw PlayerError.canNotPause }
    func stop(context:Player) throws { throw PlayerError.canNotStop }
    func seek(context:Player, seconds:Int) throws { throw PlayerError.canNotSeek }
}
