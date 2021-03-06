import XCTest
@testable import AudioPlayer

class TestStateReady:XCTestCase {
    private var state:StateProtocol!
    private var player:Player!
    private var provider:MockProviderProtocol!
    private var delegate:MockPlayerDelegate!
    
    override func setUp() {
        super.setUp()
        self.state = StateReady()
        self.player = Player()
        self.provider = MockProviderProtocol()
        self.delegate = MockPlayerDelegate()
        self.player.state = self.state
        self.player.provider = self.provider
        self.player.delegate = self.delegate
    }
    
    func testPauseThrows() {
        XCTAssertThrowsError(try self.state.pause(context:self.player), "Failed to throw")
    }
    
    func testSeekThrows() {
        XCTAssertThrowsError(try self.state.seek(context:self.player, seconds:0), "Failed to throw")
    }
    
    func testPlayChangesStateToPlaying() {
        self.player.addToPlay(list:["hello world"])
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        XCTAssertEqual(self.player.currentState, State.playing)
    }
    
    func testPlayCallsProviderPlay() {
        let expect:XCTestExpectation = self.expectation(description:"Play not called")
        self.provider.onPlay = { expect.fulfill() }
        self.player.addToPlay(list:["hello world"])
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testPlayCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusPlaying = { expect.fulfill() }
        self.player.addToPlay(list:["hello world"])
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testStopChangesStateToStopped() {
        XCTAssertNoThrow(try self.player.stop(), "Failed to stop")
        XCTAssertEqual(self.player.currentState, State.stopped)
    }
    
    func testStopCallsProviderStop() {
        let expect:XCTestExpectation = self.expectation(description:"Play not called")
        self.provider.onStop = { expect.fulfill() }
        XCTAssertNoThrow(try self.player.stop(), "Failed to stop")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testStopCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusStopped = { expect.fulfill() }
        XCTAssertNoThrow(try self.player.stop(), "Failed to stop")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testAddToPlaylistKeepsState() {
        self.player.addToPlay(list:[String()])
        XCTAssertEqual(self.player.currentState, State.ready)
    }
}
