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
        self.state.setSource(context:self, url:url)
    }
    
    func addToPlay(list:[String]) {
        
    }
    
    func clearList() {
        
    }
    
    func play() throws {
        try self.state.play(context:self)
    }
    
    func pause() throws {
        try self.state.pause(context:self)
    }
    
    func stop() throws {
        try self.state.stop(context:self)
    }
    
    func seek(seconds:Float) throws {
        try self.state.seek(context:self, seconds:Int(seconds * Constants.nanoSecondsToSeconds))
    }
}
