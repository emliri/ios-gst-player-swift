import Foundation

public class Player {
    private var delegate:PlayerDelegate?
    private var player:OpaquePointer?
    
    public init() {
        GstPlayerCreate({ (a:UnsafeMutableRawPointer?, time:Int, data:UnsafeMutableRawPointer?) in
            guard
                let data:UnsafeMutableRawPointer = data
            else { return }
            let player:Player = Unmanaged<Player>.fromOpaque(data).takeRetainedValue()
            player.delegate?.updated(position:Float(time))
            
        }, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
    }

    public func play() {
        
    }
}
