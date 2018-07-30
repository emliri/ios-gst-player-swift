import Foundation

extension StateProtocol {
    func setSource(context:Player, url:String) { }
    func play(context:Player) throws { }
    func pause(context:Player) throws { }
    func stop(context:Player) throws { }
    func seek(context:Player, seconds:Int) throws { }
    func endOfStream(context:Player) { }
}
