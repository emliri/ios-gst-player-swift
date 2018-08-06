import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?
    var currentState:State { get { return self.state.value } }
    var provider:ProviderProtocol
    var state:StateProtocol
    var list:[String]
    var current:Int
    
    init() {
        self.state = States.stopped
        self.provider = Factory.makeProvider()
        self.list = []
        self.current = 0
        self.provider.delegate = self
    }
    
    func addToPlay(list:[String]) {
        self.state.addToPlay(context:self, list:list)
    }
    
    func clearList() {
        self.state.clearList(context:self)
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
    
    func playerPlay() {
        self.provider.stop()
        self.provider.setSource(url:self.list[self.current])
        self.provider.play()
        self.delegate?.playerStatusPlaying()
        self.state = States.playing
    }
    
    func playerStop() {
        self.list = []
        self.current = 0
        self.provider.stop()
        self.delegate?.playerStatusStopped()
        self.state = States.stopped
    }
}
