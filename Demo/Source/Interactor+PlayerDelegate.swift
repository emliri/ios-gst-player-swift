import Foundation
import AudioPlayer

extension Interactor:PlayerDelegate {
    func playerUpdated(position:Float) {
        self.presenter.update(time:position)
    }
}
