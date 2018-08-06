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
    
    func endOfStream(context:Player) {
        do {
            try self.next(context:context)
        } catch {
            context.playerStop()
        }
    }
    
    func next(context:Player) throws {
        try context.playerNext()
        context.playerPlay()
    }
    
    func previous(context:Player) throws {
        try context.playerPrevious()
        context.playerPlay()
    }
    
    func play(context:Player) throws { throw PlayerError.alreadyPlaying }
}
