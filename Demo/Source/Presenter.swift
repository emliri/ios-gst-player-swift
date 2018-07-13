import Foundation
import AudioPlayer

class Presenter {
    weak var view:View?
    var viewModel:ViewModel { didSet { self.view?.updateViewModel() } }
    let player:PlayerProtocol
    
    init() {
        self.player = PlayerFactory.makePlayer()
        self.viewModel = ViewModel()
        self.player.delegate = self
    }
}
