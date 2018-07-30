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
        print("end of stream")
    }
    
    func foundError(message:String, code:Int) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerError(message:message)
        }
    }
}
