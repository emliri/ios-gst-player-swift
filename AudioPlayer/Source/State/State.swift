import Foundation

struct State {
    static let none:StateProtocol = StateNone()
    static let playing:StateProtocol = StatePlaying()
}
