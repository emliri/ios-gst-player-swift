import Foundation

protocol StateProtocol {
    var value:PlayerState { get }
    
    func play(player:Player) throws
}
