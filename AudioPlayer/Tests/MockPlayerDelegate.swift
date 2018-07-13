import Foundation
import AudioPlayer

class MockPlayerDelegate:PlayerDelegate {
    var onStatusPlaying:(() -> Void)?
    var onStatusPaused:(() -> Void)?
    
    func playerStatusPlaying() {
        self.onStatusPlaying?()
    }
    
    func playerStatusPaused() {
        self.onStatusPaused?()
    }
}
