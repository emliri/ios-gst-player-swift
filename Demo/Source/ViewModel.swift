import Foundation

struct ViewModel {
    var playing:String
    var currentTime:String
    var currentDuration:String
    var sliderValue:Float
    var sliderMaxValue:Float
    var sliderHidden:Bool
    var buttonPlayEnabled:Bool
    var buttonStopEnabled:Bool
    var buttonPauseEnabled:Bool
    var buttonNextEnabled:Bool
    var buttonPreviousEnabled:Bool
    
    init() {
        self.playing = String()
        self.currentTime = String()
        self.currentDuration = String()
        self.sliderValue = 0
        self.sliderMaxValue = 0
        self.sliderHidden = true
        self.buttonPlayEnabled = false
        self.buttonStopEnabled = false
        self.buttonPauseEnabled = false
        self.buttonNextEnabled = false
        self.buttonPreviousEnabled = false
    }
}
