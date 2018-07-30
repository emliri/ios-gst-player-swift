import Foundation
import AudioPlayer

class MockPlayerDelegate:PlayerDelegate {
    var onStatusPlaying:(() -> Void)?
    var onStatusPaused:(() -> Void)?
    var onStatusStopped:(() -> Void)?
    var onStatusReady:(() -> Void)?
    var onUpdatedPosition:((Float) -> Void)?
    var onUpdatedDuration:((Float) -> Void)?
    var onError:(() -> Void)?
    
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
        self.onUpdatedPosition?(seconds)
    }
    
    func playerUpdatedDuration(seconds:Float) {
        self.onUpdatedDuration?(seconds)
    }
    
    func playerError(message:String) {
        self.onError?()
    }
}
