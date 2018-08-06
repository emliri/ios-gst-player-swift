import Foundation

protocol StateProtocol {
    var value:State { get }
    
    func addToPlay(context:Player, list:[String])
    func clearList(context:Player)
    func play(context:Player) throws
    func pause(context:Player) throws
    func stop(context:Player) throws
    func seek(context:Player, seconds:Int) throws
    func endOfStream(context:Player)
}
