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
    
    func endOfStream(context:Player) {
        self.onEndOfStream?()
    }
}
