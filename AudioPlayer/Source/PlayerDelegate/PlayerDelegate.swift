import Foundation

public protocol PlayerDelegate:AnyObject {
    func playerStatusPlaying()
    
    func playerUpdated(seconds:Float)
}
