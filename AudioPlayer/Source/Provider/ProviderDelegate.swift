import Foundation

@objc protocol ProviderDelegate:AnyObject {
    func positionCallback(time:Float)
    func durationCallback(time:Float)
}
