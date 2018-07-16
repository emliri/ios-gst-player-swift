import Foundation

public protocol PlayerDelegate:AnyObject {
    func playerStatusPlaying()
    func playerStatusPaused()
    
    func playerUpdatedPosition(seconds:Float)
    func playerUpdatedDuration(seconds:Float)
}
