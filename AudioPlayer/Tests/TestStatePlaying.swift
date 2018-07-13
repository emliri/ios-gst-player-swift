import XCTest
@testable import AudioPlayer

class TestStatePlaying:XCTestCase {
    private var state:StateProtocol!
    private var player:Player!
    private var provider:MockProviderProtocol!
    private var delegate:MockPlayerDelegate!
    
    override func setUp() {
        super.setUp()
        self.state = StatePlaying()
        self.player = Player()
        self.provider = MockProviderProtocol()
        self.delegate = MockPlayerDelegate()
        self.player.state = self.state
        self.player.provider = self.provider
        self.player.delegate = self.delegate
    }
    
    func testPauseChangesStateToPause() {
        XCTAssertNoThrow(try self.player.pause(), "Failed")
        XCTAssertEqual(self.player.currentState, PlayerState.paused)
    }
    
    func testPauseCallsProviderPlay() {
        let expect:XCTestExpectation = self.expectation(description:"Pause not called")
        self.provider.onPause = { expect.fulfill() }
        XCTAssertNoThrow(try self.player.pause(), "Failed")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testPauseCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusPaused = { expect.fulfill() }
        XCTAssertNoThrow(try self.player.pause(), "Failed to play")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
