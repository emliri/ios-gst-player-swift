import XCTest
@testable import AudioPlayer

class TestStatePaused:XCTestCase {
    private var state:StateProtocol!
    private var player:Player!
    private var provider:MockProviderProtocol!
    private var delegate:MockPlayerDelegate!
    
    override func setUp() {
        super.setUp()
        self.state = StatePaused()
        self.player = Player()
        self.provider = MockProviderProtocol()
        self.delegate = MockPlayerDelegate()
        self.player.state = self.state
        self.player.provider = self.provider
        self.player.delegate = self.delegate
    }
    
    func testPlayChangesStateToPlaying() {
        self.player.media.url = "hello world"
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        XCTAssertEqual(self.player.currentState, PlayerState.playing)
    }
    
    func testPlayCallsProviderPlay() {
        let expect:XCTestExpectation = self.expectation(description:"Play not called")
        self.provider.onPlay = { expect.fulfill() }
        self.player.media.url = "hello world"
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testPlayCallsStateOnDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Delegate not called")
        self.delegate.onStatusPlaying = { expect.fulfill() }
        self.player.media.url = "hello world"
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
