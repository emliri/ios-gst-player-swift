import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?
    var media:PlayerMedia
    var currentState:PlayerState { get { return self.state.value } }
    var provider:ProviderProtocol
    var state:StateProtocol
    
    init() {
        self.media = PlayerMedia()
        self.state = State.none
        self.provider = Factory.makeProvider()
        self.provider.delegate = self
    }
    
    func play() throws {
        try self.state.play(player:self)
        //self.provider.set(uri:uri)
    }
}
