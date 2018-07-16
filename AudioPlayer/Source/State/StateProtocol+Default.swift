import Foundation

extension StateProtocol {
    func setSource(player:Player, url:String) throws { }
    func removeSource(player:Player) { }
    func play(player:Player) throws { }
    func pause(player:Player) throws { }
}
