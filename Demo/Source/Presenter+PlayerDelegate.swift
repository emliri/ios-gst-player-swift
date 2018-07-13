import Foundation
import AudioPlayer

extension Presenter:PlayerDelegate {
    func playerUpdated(position:Float) {
        guard
            let timeString:String = self.numberFormatter.string(from:NSNumber(value:position))
        else { return }
        self.viewModel.currentTime = timeString
    }
}
