import Foundation
import AudioPlayer

class Interactor:PlayerDelegate {
    private let player:Player
    
    init() {
        self.player = Player()
        self.player.delegate = self
    }
    
    func play() {
        print("play")

        let bundle:Bundle = Bundle.main
        let url:URL = bundle.url(forResource:"guitars", withExtension:"m4a")!
        print(url.standardizedFileURL.path)
        
        //self.player.setUri(uri:url.standardizedFileURL.path)
        //self.player.setUri(uri: )
        //self.player.setUri(uri: )
        
        var uri: String;
        
        uri = url.standardizedFileURL.absoluteString // NOTE: Need absolute URL string here with 'file://' scheme, not only path !
        
        //uri = "http://tchakabam.com/test-media/m4a/guitars.m4a"
        //uri = "http://tchakabam.com/test-media/m4a/Theo Katzman - Heartbreak Hits - 08 As the Romans Do.mp3"
        //uri = "http://tchakabam.com/test-media/m4a/shalafon.mp3"
        
        self.player.setUri(uri: uri)
        
        self.player.play()
    }
    
    func updated(position:Float) {
        print("Player delegate at position: \(position)")
    }
}
