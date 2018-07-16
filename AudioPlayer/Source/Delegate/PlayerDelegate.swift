import Foundation

public protocol PlayerDelegate:AnyObject {
    func playerStatusPlaying()
    func playerStatusPaused()
    func playerStatusStopped()
    func playerStatusReady()
    
    func playerUpdatedPosition(seconds:Float)
    func playerUpdatedDuration(seconds:Float)
}
