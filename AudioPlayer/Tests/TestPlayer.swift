import XCTest
@testable import AudioPlayer

class TestPlayer:XCTestCase {
    private var player:Player!
    private var state:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.player = Player()
        self.state = MockStateProtocol()
        self.player.state = self.state
    }
    
    func testInitialStateIsNone() {
        XCTAssertEqual(self.player.state.value, PlayerState.none, "Invalid state")
    }
    
    func testRethrowIfStateThrows() {
        self.state.error = NSError()
        XCTAssertThrowsError(try self.player.play(), "Failed to throw error")
    }
}
