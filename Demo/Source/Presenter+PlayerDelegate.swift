import Foundation
import AudioPlayer

extension Presenter:PlayerDelegate {
    func playerUpdated(position:Float) {
        let minutes:Int = Int(position) / 60 % 60
        let seconds:Float = position.truncatingRemainder(dividingBy:60)
        self.viewModel.currentTime = String(format:"%02i:%05.2f", minutes, seconds)
    }
}
