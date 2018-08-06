import Foundation

extension Presenter {
    func setPlay(list:[String]) {
        self.player.addToPlay(list:list)
    }
    
    func clearPlayList() {
        self.player.clearList()
    }
    
    @objc func play() {
        do {
            try self.player.play()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    @objc func pause() {
        do {
            try self.player.pause()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    @objc func stop() {
        self.view?.viewContent.segmented.selectedSegmentIndex = 0
        do {
            try self.player.stop()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    @objc func next() {
        do {
            try self.player.next()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    @objc func previous() {
        do {
            try self.player.previous()
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
    
    func seek(seconds:Float) {
        do {
            try self.player.seek(seconds:seconds)
        } catch let error {
            self.showAlert(message:error.localizedDescription)
        }
    }
}
