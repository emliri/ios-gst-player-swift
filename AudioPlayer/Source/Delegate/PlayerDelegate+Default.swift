import Foundation

public extension PlayerDelegate {
    func playerStatusPlaying() { }
    func playerStatusPaused() { }
    
    func playerUpdatedPosition(seconds:Float) { }
    func playerUpdatedDuration(seconds:Float) { }
}
