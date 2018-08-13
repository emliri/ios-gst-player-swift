import Foundation

class StatePaused:StateProtocol {
    let value:State
    
    init() {
        self.value = State.paused
    }
    
    func addToPlay(context:Player, list:[String]) {
        context.list.append(contentsOf:list)
    }
    
    func clearList(context:Player) {
        context.playerStop()
    }
    
    func play(context:Player) throws {
        context.provider.play()
        context.delegate?.playerStatusPlaying()
        context.state = States.playing
    }
    
    func stop(context:Player) throws {
        context.playerStop()
    }
    
    func seek(context:Player, seconds:Int) throws {
        context.provider.seek(seconds:seconds)
    }
    
    func next(context:Player) throws { try context.playerNext() }
    func previous(context:Player) throws { try context.playerPrevious() }
    func pause(context:Player) throws { throw PlayerError.canNotPause }
    func endOfStream(context:Player) { }
}
