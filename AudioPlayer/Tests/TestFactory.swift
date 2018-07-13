import XCTest
@testable import AudioPlayer

class TestFactory:XCTestCase {
    func testMakePlayerReturnsNotNil() {
        let player:PlayerProtocol? = Factory.makePlayer()
        XCTAssertNotNil(player, "Failed to return player")
        XCTAssertNotNil(Factory.monostate, "Failed to retain reference to player")
        XCTAssertTrue(player === Factory.monostate, "Mono state is not the same as player returned")
    }
    
    func testCreatesOnlyOneInstanceOfPlayer() {
        let playerFirst:PlayerProtocol = Factory.makePlayer()
        let _:PlayerProtocol = Factory.makePlayer()
        let _:PlayerProtocol = Factory.makePlayer()
        let _:PlayerProtocol = Factory.makePlayer()
        let playerLast:PlayerProtocol = Factory.makePlayer()
        XCTAssertTrue(playerFirst === playerLast, "Creating multiple instances")
    }
}
