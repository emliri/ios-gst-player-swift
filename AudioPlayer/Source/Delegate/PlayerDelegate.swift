import Foundation

public protocol PlayerDelegate:AnyObject {
    func playerStatusPlaying()
    func playerStatusPaused()
    func playerStatusStopped()
    func playerStatusReady()
    
    func playerUpdatedPlaying(url:String)
    func playerUpdatedPosition(seconds:Float)
    func playerUpdatedDuration(seconds:Float)
    func playerError(message:String)
}
