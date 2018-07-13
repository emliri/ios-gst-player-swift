import Foundation
@testable import AudioPlayer

class MockProviderProtocol:ProviderProtocol {
    var onPlay:(() -> Void)?
    var delegate:ProviderDelegate?
    var url:String?
    
    required init() { }
    
    func setSource(url:String) {
        self.url = url
    }
    
    func play() {
        self.onPlay?()
    }
}
