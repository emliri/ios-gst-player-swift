import Foundation

public class Player {
    private var delegate:PlayerDelegate?
    private var player:UnsafeMutableRawPointer?
    
    public init() {
        self.player = GstPlayerCreate({ (a:UnsafeMutableRawPointer?, time:Int, data:UnsafeMutableRawPointer?) in
            guard
                let data:UnsafeMutableRawPointer = data
            else { return }
            let player:Player = Unmanaged<Player>.fromOpaque(data).takeRetainedValue()
            player.delegate?.updated(position:Float(time))
            
        }, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
    }

    public func setUri(uri: String) {
        GstPlayerSetUri(UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()), uri)
    }
    
    public func play() {
        GstPlayerPlay(UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
    }
}
