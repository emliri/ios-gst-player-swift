import Foundation

@objc protocol PlayerProviderDelegate:AnyObject {
    func positionCallback(time:Float)
}
