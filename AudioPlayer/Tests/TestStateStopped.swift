import XCTest
@testable import AudioPlayer

class TestStateStopped:XCTestCase {
    private var state:StateProtocol!
    private var player:Player!
    private var provider:MockProviderProtocol!
    private var delegate:MockPlayerDelegate!
    
    override func setUp() {
        super.setUp()
        self.state = StateStopped()
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
    
    func testStopThrows() {
        XCTAssertThrowsError(try self.state.stop(context:self.player), "Failed to throw")
    }
    
    func testPauseThrows() {
        XCTAssertThrowsError(try self.state.pause(context:self.player), "Failed to throw")
    }
    
    func testSeekThrows() {
        XCTAssertThrowsError(try self.state.seek(context:self.player, seconds:0), "Failed to throw")
    }
    
    func testSetSourceChangesStateToReady() {
        self.player.setSource(url:"hello world")
        XCTAssertEqual(self.player.currentState, State.ready)
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
}
