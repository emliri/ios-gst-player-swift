import Foundation

extension Player:PlayerProviderDelegate {
    func positionCallback(time:Float) {
        let time:Float = self.format(time:time)
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.playerUpdated(position:time)
        }
    }
    
    private func format(time:Float) -> Float {
        return time / PlayerConstants.timeFormatDivider
    }
}
