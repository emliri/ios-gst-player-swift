import Foundation

public extension PlayerDelegate {
    func playerStatusPlaying() { }
    func playerStatusPaused() { }
    func playerStatusStopped() { }
    func playerStatusReady() { }
    
    func playerUpdatedPosition(seconds:Float) { }
    func playerUpdatedDuration(seconds:Float) { }
    func playerError(message:String) { }
}
