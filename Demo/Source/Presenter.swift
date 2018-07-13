import Foundation
import AudioPlayer

class Presenter {
    weak var view:View?
    var viewModel:ViewModel { didSet { self.view?.updateViewModel() } }
    var numberFormatter:NumberFormatter!
    let player:PlayerProtocol
    
    init() {
        self.player = PlayerFactory.makePlayer()
        self.viewModel = ViewModel()
        self.player.delegate = self
        self.configurePresenter()
    }
    
    private func configurePresenter() {
        self.configureFormatters()
    }
    
    private func configureFormatters() {
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.numberStyle = NumberFormatter.Style.decimal
        self.numberFormatter.minimumIntegerDigits = ViewConstants.Time.minIntegers
        self.numberFormatter.minimumFractionDigits = ViewConstants.Time.decimals
        self.numberFormatter.maximumFractionDigits = ViewConstants.Time.decimals
    }
}
