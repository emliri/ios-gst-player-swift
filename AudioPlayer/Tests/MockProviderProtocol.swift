import Foundation
@testable import AudioPlayer

class MockProviderProtocol:ProviderProtocol {
    var onPlay:(() -> Void)?
    var onPause:(() -> Void)?
    var onStop:(() -> Void)?
    var onSeek:(() -> Void)?
    var delegate:ProviderDelegate?
    var url:String?
    
    required init() { }
    
    func setSource(url:String) {
        self.url = url
    }
    
    func play() {
        self.onPlay?()
    }
    
    func pause() {
        self.onPause?()
    }
    
    func stop() {
        self.onStop?()
    }
    
    func seek(seconds:CLong) {
        self.onSeek?()
    }
}
