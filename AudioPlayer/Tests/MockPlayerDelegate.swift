import Foundation
import AudioPlayer

class MockPlayerDelegate:PlayerDelegate {
    var onStatusPlaying:(() -> Void)?
    var onStatusPaused:(() -> Void)?
    var onStatusStopped:(() -> Void)?
    var onStatusReady:(() -> Void)?
    var onUpdatedPosition:(() -> Void)?
    var onUpdatedDuration:(() -> Void)?
    
    func playerStatusPlaying() {
        self.onStatusPlaying?()
    }
    
    func playerStatusPaused() {
        self.onStatusPaused?()
    }
    
    func playerStatusStopped() {
        self.onStatusStopped?()
    }
    func playerStatusReady() {
        self.onStatusReady?()
    }
    
    func playerUpdatedPosition(seconds:Float) {
        self.onUpdatedPosition?()
    }
    
    func playerUpdatedDuration(seconds:Float) {
        self.onUpdatedDuration?()
    }
}
