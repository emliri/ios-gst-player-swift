import Foundation

extension Player:PlayerProviderDelegate {
    func positionCallback(time:Float) {
        print("time updated: \(time)")
    }
}
