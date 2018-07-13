import Foundation

extension Presenter {
    var sourceUrl:String? {
        get { return self.player.media.url }
        set(newValue) { self.player.media.url = newValue }
    }
    
    func play() {
        do {
            try self.player.play()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
        
        /*
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
        
        self.player.play()*/
    }
    
    func pause() {
        do {
            try self.player.pause()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
}
