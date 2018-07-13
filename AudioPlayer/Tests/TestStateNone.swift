import XCTest
@testable import AudioPlayer

class TestStateNone:XCTestCase {
    private var state:StateNone!
    private var player:Player!
    private var provider:MockProviderProtocol!
    private var delegate:MockPlayerDelegate!
    
    override func setUp() {
        super.setUp()
        self.state = StateNone()
        self.player = Player()
        self.provider = MockProviderProtocol()
        self.delegate = MockPlayerDelegate()
        self.player.provider = self.provider
        self.player.delegate = self.delegate
    }
    
    func testPlayThrowsIfNotSourceSet() {
        XCTAssertThrowsError(try self.state.play(player:self.player), "Failed to throw")
    }
    
    func testPlayChangesStateToPlaying() {
        self.player.media.url = "hello world"
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        XCTAssertEqual(self.player.currentState, PlayerState.playing)
    }
    
    func testPlaySendsSourceToProvider() {
        self.player.media.url = "hello world"
        XCTAssertNoThrow(try self.player.play(), "Failed to play")
        XCTAssertNotNil(self.provider.url, "Failed to assign source")
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
