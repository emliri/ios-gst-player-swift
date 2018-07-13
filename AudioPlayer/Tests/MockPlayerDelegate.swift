import Foundation
import AudioPlayer

class MockPlayerDelegate:PlayerDelegate {
    var onStatusPlaying:(() -> Void)?
    
    func playerStatusPlaying() {
        self.onStatusPlaying?()
    }
}
