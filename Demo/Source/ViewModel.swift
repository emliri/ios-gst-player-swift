import Foundation

struct ViewModel {
    var currentTime:String
    var buttonPlayEnabled:Bool
    var buttonStopEnabled:Bool
    var buttonPauseEnabled:Bool
    var buttonNextEnabled:Bool
    var buttonPreviousEnabled:Bool
    
    init() {
        self.currentTime = String()
        self.buttonPlayEnabled = false
        self.buttonStopEnabled = false
        self.buttonPauseEnabled = false
        self.buttonNextEnabled = false
        self.buttonPreviousEnabled = false
    }
}
