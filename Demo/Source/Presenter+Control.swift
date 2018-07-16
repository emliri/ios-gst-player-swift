import Foundation

extension Presenter {
    func setSource(url:String) {
        self.player.setSource(url:url)
    }
    
    func removeSource() {
        self.stop()
    }
    
    func play() {
        do {
            try self.player.play()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    func pause() {
        do {
            try self.player.pause()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    func stop() {
        do {
            try self.player.stop()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
}
