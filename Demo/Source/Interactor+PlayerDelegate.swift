import Foundation
import AudioPlayer

extension Interactor:PlayerDelegate {
    func playerUpdated(position:Float) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter.update(time:position)
        }
    }
}
