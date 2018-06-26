import Foundation
import AudioPlayer

class Interactor {
    private let player:Player
    
    init() {
        self.player = Player()
    }
    
    func play() {
        let bundle:Bundle = Bundle.main
        let url:URL = bundle.url(forResource:"guitars", withExtension:"m4a")!
        print("playing ")
        print(url.standardizedFileURL.path)
        self.player.setUri(uri:url.standardizedFileURL.path)
    }
}
