import Foundation

struct States {
    static let stopped:StateProtocol = StateStopped()
    static let ready:StateReady = StateReady()
    static let playing:StateProtocol = StatePlaying()
    static let paused:StateProtocol = StatePaused()
}
