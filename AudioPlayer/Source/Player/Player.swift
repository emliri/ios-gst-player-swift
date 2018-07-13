import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?
    var provider:ProviderProtocol
    
    init() {
        self.provider = Factory.makeProvider()
        self.provider.delegate = self
    }

    func setUri(uri: String) {
        self.provider.set(uri:uri)
    }
    
    func play() {
        self.provider.play()
    }
}
