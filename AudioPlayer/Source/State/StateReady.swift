import Foundation

class StateReady:StateProtocol {
    let value:State
    
    init() {
        self.value = State.ready
    }
    
    func addToPlay(context:Player, list:[String]) {
        context.list.append(contentsOf:list)
    }
    
    func clearList(context:Player) {
        context.playerStop()
    }
    
    func play(context:Player) throws {
        context.playerPlay()
    }
    
    func stop(context:Player) throws {
        context.playerStop()
    }
    
    func next(context:Player) throws { try context.playerNext() }
    func pause(context:Player) throws { throw PlayerError.canNotPause }
    func seek(context:Player, seconds:Int) throws { throw PlayerError.canNotSeek }
    func previous(context:Player) throws { throw PlayerError.noPrevious }
    func endOfStream(context:Player) { }
}
