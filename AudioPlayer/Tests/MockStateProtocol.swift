import Foundation
@testable import AudioPlayer

class MockStateProtocol:StateProtocol {
    var error:Error?
    var onEndOfStream:(() -> Void)?
    let value:State
    
    init() {
        self.value  = State.stopped
    }
    
    func play(context:Player) throws {
        if let error:Error = self.error {
            throw error
        }
    }
    
    func addToPlay(context:Player, list:[String]) { }
    func clearList(context:Player) { }
    func pause(context:Player) throws { }
    func stop(context:Player) throws { }
    func seek(context:Player, seconds:Int) throws { }
    func next(context:Player) throws { }
    func previous(context:Player) throws { }
    func endOfStream(context:Player) {
        self.onEndOfStream?()
    }
}
