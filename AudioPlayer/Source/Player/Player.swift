import Foundation

class Player:PlayerProtocol {
    weak var delegate:PlayerDelegate?

    private var gstPlayer:UnsafeMutableRawPointer?
    var provider:PlayerProviderProtocol
    
    init() {
        self.provider = PlayerProviderFactory.makeProvider()
        
        /*
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
            
            player.delegate?.playerUpdated(position:Float(time))
            
        }, UnsafeMutableRawPointer(Unmanaged<Player>.passUnretained(self).toOpaque()))
        */
    }

    func setUri(uri: String) {
        self.provider.set(uri:uri)
//        GstPlayerSetUri(self.gstPlayer, uri)
    }
    
    func play() {
        self.provider.play()
//        GstPlayerPlay(self.gstPlayer)
    }
}
