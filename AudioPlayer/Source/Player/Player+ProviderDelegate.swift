import Foundation

extension Player:ProviderDelegate {
    func positionCallback(time:Float) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerUpdatedPosition(seconds:time / Constants.nanoSecondsToSeconds)
        }
    }
    
    func durationCallback(time:Float) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerUpdatedDuration(seconds:time / Constants.nanoSecondsToSeconds)
        }
    }
    
    func foundError(message:String) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerError(message:message)
        }
    }
}
