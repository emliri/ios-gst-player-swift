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
    
    func setSource(url:String) throws {
        try self.state.setSource(player:self, url:url)
    }
    
    func removeSource() {
        self.state.removeSource(player:self)
    }
    
    func play() throws {
        try self.state.play(player:self)
    }
    
    func pause() throws {
        try self.state.pause(player:self)
    }
}
