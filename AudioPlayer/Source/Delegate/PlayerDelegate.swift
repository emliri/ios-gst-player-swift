import Foundation

public protocol PlayerDelegate:AnyObject {
    func playerStatusPlaying()
    func playerStatusPaused()
    
    func playerUpdated(seconds:Float)
}
