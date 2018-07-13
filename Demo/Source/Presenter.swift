import UIKit
import AudioPlayer

class Presenter {
    weak var view:View?
    var viewModel:ViewModel { didSet { self.view?.updateViewModel() } }
    let player:PlayerProtocol
    
    init() {
        self.player = Factory.makePlayer()
        self.viewModel = ViewModel()
        self.player.delegate = self
    }
    
    func showAlert(message:String) {
        let alert:UIAlertController = UIAlertController(title:nil, message:message,
                                                        preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:NSLocalizedString("Presenter_AlertAccept", comment:String()),
                                      style:UIAlertActionStyle.cancel, handler:nil))
        self.view?.present(alert, animated:true, completion:nil)
    }
}
