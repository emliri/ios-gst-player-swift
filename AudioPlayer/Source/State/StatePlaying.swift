import Foundation

class StatePlaying:StateProtocol {
    let value:PlayerState
    
    init() {
        self.value = PlayerState.playing
    }
}
