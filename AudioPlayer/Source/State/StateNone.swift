import Foundation

class StateNone:StateProtocol {
    let state:PlayerState
    
    init() {
        self.state = PlayerState.none
    }
}
