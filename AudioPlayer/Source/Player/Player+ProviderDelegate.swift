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
    
    func endOfStream() {
        DispatchQueue.main.async { [weak self] in
            guard let player:Player = self else { return }
            self?.state.endOfStream(context:player)
        }
    }
    
    func foundError(message:String, code:Int) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerError(message:message)
        }
    }
}
