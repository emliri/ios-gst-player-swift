import Foundation
import AudioPlayer

extension Presenter:PlayerDelegate {
    func playerStatusPlaying() {
        self.viewModel.sliderHidden = false
        self.viewModel.buttonPlayEnabled = false
        self.viewModel.buttonNextEnabled = true
        self.viewModel.buttonPreviousEnabled = true
        self.viewModel.buttonPauseEnabled = true
        self.viewModel.buttonStopEnabled = true
    }
    
    func playerStatusPaused() {
        self.viewModel.sliderHidden = false
        self.viewModel.buttonPlayEnabled = true
        self.viewModel.buttonNextEnabled = true
        self.viewModel.buttonPreviousEnabled = true
        self.viewModel.buttonPauseEnabled = false
        self.viewModel.buttonStopEnabled = true
    }
    
    func playerStatusStopped() {
        self.viewModel.sliderHidden = true
        self.viewModel.buttonPlayEnabled = false
        self.viewModel.buttonNextEnabled = false
        self.viewModel.buttonPreviousEnabled = false
        self.viewModel.buttonPauseEnabled = false
        self.viewModel.buttonStopEnabled = false
        self.viewModel.currentTime = String()
        self.viewModel.currentDuration = String()
    }
    
    func playerStatusReady() {
        self.viewModel.sliderHidden = true
        self.viewModel.buttonPlayEnabled = true
        self.viewModel.buttonNextEnabled = false
        self.viewModel.buttonPreviousEnabled = false
        self.viewModel.buttonPauseEnabled = false
        self.viewModel.buttonStopEnabled = true
        self.viewModel.currentTime = String()
        self.viewModel.currentDuration = String()
    }
    
    func playerUpdatedPosition(seconds:Float) {
        self.viewModel.sliderValue = seconds
        self.viewModel.currentTime = self.timeFrom(seconds:seconds)
    }
    
    func playerUpdatedDuration(seconds:Float) {
        self.viewModel.sliderMaxValue = seconds
        self.viewModel.currentDuration = self.timeFrom(seconds:seconds)
    }
    
    private func timeFrom(seconds:Float) -> String {
        let minutes:Int = Int(seconds) / 60 % 60
        let seconds:Float = seconds.truncatingRemainder(dividingBy:60)
        return String(format:"%02i:%05.2f", minutes, seconds)
    }
}
