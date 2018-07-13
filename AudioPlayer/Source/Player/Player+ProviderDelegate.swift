import Foundation

extension Player:ProviderDelegate {
    func positionCallback(time:Float) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerUpdated(seconds:time / Constants.nanoSecondsToSeconds)
        }
    }
}
