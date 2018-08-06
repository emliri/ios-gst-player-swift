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
    
    func testPlayThrows() {
        XCTAssertThrowsError(try self.state.play(context:self.player), "Failed to throw")
    }
    
    func testPauseChangesStateToPause() {
        XCTAssertNoThrow(try self.player.pause(), "Failed")
        XCTAssertEqual(self.player.currentState, State.paused)
    }
    
    func testPauseCallsProviderPause() {
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
    
    func testSetSourceChangesStateToReady() {
        self.player.setSource(url:"hello world")
        XCTAssertEqual(self.player.currentState, State.ready)
    }
    
    func testSetSourceCallsProviderStop() {
        let expect:XCTestExpectation = self.expectation(description:"Stop not called")
        self.provider.onStop = { expect.fulfill() }
        self.player.setSource(url:"hello world")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSetSourceSendsSourceToProvider() {
        self.player.setSource(url:"hello world")
        XCTAssertNotNil(self.provider.url, "Failed to assign source")
    }
    
    func testSetSourceCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusReady = { expect.fulfill() }
        self.player.setSource(url:"hello world")
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
    
    func testSeekCallsProviderSeek() {
        let expect:XCTestExpectation = self.expectation(description:"Play not called")
        self.provider.onSeek = { expect.fulfill() }
        XCTAssertNoThrow(try self.player.seek(seconds:0), "Failed to seek")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testEndStopsAndChangesStateToReady() {
        self.state.endOfStream(context:self.player)
        XCTAssertEqual(self.player.currentState, State.ready)
    }
    
    func testEndStopsAndCallsProviderStop() {
        let expect:XCTestExpectation = self.expectation(description:"Play not called")
        self.provider.onStop = { expect.fulfill() }
        self.player.endOfStream()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testEndStopsAndCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusReady = { expect.fulfill() }
        self.player.endOfStream()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
