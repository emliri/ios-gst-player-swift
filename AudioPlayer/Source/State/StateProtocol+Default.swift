import Foundation

extension StateProtocol {
    func setSource(player:Player, url:String) { }
    func play(player:Player) throws { }
    func pause(player:Player) throws { }
    func stop(player:Player) throws { }
}
