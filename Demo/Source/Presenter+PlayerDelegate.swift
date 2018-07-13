import Foundation
import AudioPlayer

extension Presenter:PlayerDelegate {
    func playerStatusPlaying() {
        self.viewModel.buttonPlayEnabled = false
        self.viewModel.buttonNextEnabled = true
        self.viewModel.buttonPreviousEnabled = true
        self.viewModel.buttonPauseEnabled = true
        self.viewModel.buttonStopEnabled = true
    }
    
    func playerStatusPaused() {
        self.viewModel.buttonPlayEnabled = true
        self.viewModel.buttonNextEnabled = true
        self.viewModel.buttonPreviousEnabled = true
        self.viewModel.buttonPauseEnabled = false
        self.viewModel.buttonStopEnabled = true
    }
    
    func playerUpdated(seconds:Float) {
        let minutes:Int = Int(seconds) / 60 % 60
        let seconds:Float = seconds.truncatingRemainder(dividingBy:60)
        self.viewModel.currentTime = String(format:"%02i:%05.2f", minutes, seconds)
    }
}
