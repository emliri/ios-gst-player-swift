import Foundation

protocol StateProtocol {
    var value:State { get }
    
    func setSource(player:Player, url:String)
    func play(player:Player) throws
    func pause(player:Player) throws
    func stop(player:Player) throws
    func seek(player:Player, seconds:Float) throws
}
