import Foundation
import AudioPlayer

class Presenter {
    weak var view:View!
    let numberFormatter:NumberFormatter
    let player:PlayerProtocol
    
    init() {
        self.player = PlayerFactory.makePlayer()
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.numberStyle = NumberFormatter.Style.decimal
        self.numberFormatter.minimumIntegerDigits = ViewConstants.Time.minIntegers
        self.numberFormatter.minimumFractionDigits = ViewConstants.Time.decimals
        self.numberFormatter.maximumFractionDigits = ViewConstants.Time.decimals
        self.player.delegate = self
    }
}
