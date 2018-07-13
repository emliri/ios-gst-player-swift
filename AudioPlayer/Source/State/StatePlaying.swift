import Foundation

class StatePlaying:StateProtocol {
    let state:PlayerState
    
    init() {
        self.state = PlayerState.playing
    }
}
