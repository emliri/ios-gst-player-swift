import Foundation
@testable import AudioPlayer

class MockStateProtocol:StateProtocol {
    var error:Error?
    let value:State
    
    init() {
        self.value  = State.stopped
    }
    
    func play(player:Player) throws {
        if let error:Error = self.error {
            throw error
        }
    }
}
