import XCTest
@testable import AudioPlayer

class TestProviderFactory:XCTestCase {
    func testMakeNewProviderReturnsNotNil() {
        let provider:ProviderProtocol? = Factory.makeProvider()
        XCTAssertNotNil(provider, "Failed to make a provider")
    }
}
