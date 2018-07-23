import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?
    var currentState:State { get { return self.state.value } }
    var provider:ProviderProtocol
    var state:StateProtocol
    
    init() {
        self.state = States.stopped
        self.provider = Factory.makeProvider()
        self.provider.delegate = self
    }
    
    func setSource(url:String) {
        self.state.setSource(player:self, url:url)
    }
    
    func play() throws {
        try self.state.play(player:self)
    }
    
    func pause() throws {
        try self.state.pause(player:self)
    }
    
    func stop() throws {
        try self.state.stop(player:self)
    }
    
    func seek(seconds:Float) throws {
        try self.state.seek(player:self, seconds:Int(seconds * Constants.nanoSecondsToSeconds))
    }
}
