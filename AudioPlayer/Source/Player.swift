import Foundation

public class Player {
    public var delegate:PlayerDelegate?

    private var gstPlayer:UnsafeMutableRawPointer?
    
    public init() {
        
        GstPlayerInit() // Currently MUST only be called once !! See GstPlayerInit implementation

        self.gstPlayer = GstPlayerCreate({
            (gstPlayer:UnsafeMutableRawPointer?, time:Int, context:UnsafeMutableRawPointer?) in

            guard
                let context:UnsafeMutableRawPointer = context
            else {
                print("ERROR: Context not set")
                return
            }

            print("Time:", time)
            
            /*
            let player:Player = Unmanaged<Player>.fromOpaque(context).takeRetainedValue()
            
            if (player.delegate != nil) {
                player.delegate?.updated(position:Float(time))
            }
             */
            
        }, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
    }

    public func setUri(uri: String) {
        GstPlayerSetUri(self.gstPlayer, uri)
    }
    
    public func play() {
        GstPlayerPlay(self.gstPlayer)
    }
}
