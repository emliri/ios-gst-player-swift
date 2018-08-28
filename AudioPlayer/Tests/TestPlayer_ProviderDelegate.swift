import XCTest
@testable import AudioPlayer

class TestPlayer_ProviderDelegate:XCTestCase {
    private var player:Player!
    private var delegate:MockPlayerDelegate!
    private var state:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.player = Player()
        self.delegate = MockPlayerDelegate()
        self.state = MockStateProtocol()
        self.player.delegate = self.delegate
        self.player.state = self.state
    }
    
    func testUpdatesDelegatePosition() {
        let expect:XCTestExpectation = self.expectation(description:"Not updated")
        let expected:Float = 5
        self.delegate.onUpdatedPosition = { (position:Float) in
            XCTAssertEqual(expected, position, "Invalid seconds")
            XCTAssertEqual(Thread.current, Thread.main, "Should be main thread")
            expect.fulfill()
        }
        self.player.positionCallback(time:expected * Constants.nanoSecondsToSeconds)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdatesDelegateDuration() {
        let expect:XCTestExpectation = self.expectation(description:"Not updated")
        let expected:Float = 99
        self.delegate.onUpdatedDuration = { (duration:Float) in
            XCTAssertEqual(expected, duration, "Invalid seconds")
            XCTAssertEqual(Thread.current, Thread.main, "Should be main thread")
            expect.fulfill()
        }
        self.player.durationCallback(time:expected * Constants.nanoSecondsToSeconds)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSendingErrorToDelegate() {
        let expect:XCTestExpectation = self.expectation(description:"Not updated")
        self.delegate.onError = {
            XCTAssertEqual(Thread.current, Thread.main, "Should be main thread")
            expect.fulfill()
        }
        self.player.foundError(message:"", code:0)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testEndOfStreamNotifiesState() {
        let expect:XCTestExpectation = self.expectation(description:"Not updated")
        self.state.onEndOfStream = {
            XCTAssertEqual(Thread.current, Thread.main, "Should be main thread")
            expect.fulfill()
        }
        self.player.endOfStream()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
