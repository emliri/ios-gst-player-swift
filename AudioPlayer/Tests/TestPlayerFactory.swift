import XCTest
@testable import AudioPlayer

class TestPlayerFactory:XCTestCase {
    func testMakePlayerReturnsNotNil() {
        let player:PlayerProtocol? = PlayerFactory.makePlayer()
        XCTAssertNotNil(player, "Failed to return player")
        XCTAssertNotNil(PlayerFactory.monostatePlayer, "Failed to retain reference to player")
        XCTAssertTrue(player === PlayerFactory.monostatePlayer, "Mono state is not the same as player returned")
    }
    
    func testCreatesOnlyOneInstanceOfPlayer() {
        let playerFirst:PlayerProtocol = PlayerFactory.makePlayer()
        let _:PlayerProtocol = PlayerFactory.makePlayer()
        let _:PlayerProtocol = PlayerFactory.makePlayer()
        let _:PlayerProtocol = PlayerFactory.makePlayer()
        let playerLast:PlayerProtocol = PlayerFactory.makePlayer()
        XCTAssertTrue(playerFirst === playerLast, "Creating multiple instances")
    }
}
