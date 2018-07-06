import Foundation
import AudioPlayer

extension Interactor:PlayerDelegate {
    func playerUpdated(position:Float) {
        print("Player position: \(position)")
    }
}
