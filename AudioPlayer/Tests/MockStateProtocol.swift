import Foundation
@testable import AudioPlayer

class MockStateProtocol:StateProtocol {
    var error:Error?
    let value:PlayerState
    
    init() {
        self.value  = PlayerState.none
    }
    
    func play(player:Player) throws {
        if let error:Error = self.error {
            throw error
        }
    }
}
