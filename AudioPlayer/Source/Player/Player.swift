import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?

    private var gstPlayer:UnsafeMutableRawPointer?
    
    init() {
        
        GstPlayerInit() // Currently MUST only be called once !! See GstPlayerInit implementation

        self.gstPlayer = GstPlayerCreate({
            (gstPlayer:UnsafeMutableRawPointer?, time:Int, context:UnsafeMutableRawPointer?) in

            guard
                let context:UnsafeMutableRawPointer = context
            else {
                print("ERROR: Context not set")
                assertionFailure("Failed to set context")
                return
            }

            //print("Time:", time)
            
            let player:Player = Unmanaged<Player>.fromOpaque(context).takeUnretainedValue()
            
            if (player.delegate != nil) {
                player.delegate?.updated(position:Float(time))
            }
            
        }, UnsafeMutableRawPointer(Unmanaged<Player>.passUnretained(self).toOpaque()))
    }

    func setUri(uri: String) {
        GstPlayerSetUri(self.gstPlayer, uri)
    }
    
    func play() {
        GstPlayerPlay(self.gstPlayer)
    }
}
