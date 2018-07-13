import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?
    var state:PlayerState { get { return self.currentState.state } }
    var provider:ProviderProtocol
    var currentState:StateProtocol
    
    init() {
        self.currentState = StateNone()
        self.provider = Factory.makeProvider()
        self.provider.delegate = self
    }

    func setUri(uri:String) {
        self.provider.set(uri:uri)
    }
    
    func play() {
        self.provider.play()
    }
}
