import Foundation

public extension PlayerDelegate {
    func playerStatusPlaying() { }
    func playerStatusPaused() { }
    func playerStatusStopped() { }
    func playerStatusReady() { }
    
    func playerUpdatedPlaying(url:String) { }
    func playerUpdatedPosition(seconds:Float) { }
    func playerUpdatedDuration(seconds:Float) { }
    func playerError(message:String) { }
}
