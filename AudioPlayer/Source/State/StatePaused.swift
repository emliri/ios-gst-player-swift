import Foundation

class StatePaused:StateProtocol {
    let value:PlayerState
    
    init() {
        self.value = PlayerState.paused
    }
}
