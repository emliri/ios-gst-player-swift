import XCTest
@testable import AudioPlayer

class TestPlayerProviderFactory:XCTestCase {
    func testMakeNewProviderReturnsNotNil() {
        let provider:PlayerProviderProtocol? = PlayerProviderFactory.makeProvider()
        XCTAssertNotNil(provider, "Failed to make a provider")
    }
    
    func testUseTypeFromStaticVar() {
        PlayerProviderFactory.providerType = MockPlayerProviderProtocol.self
        let provider:MockPlayerProviderProtocol? = PlayerProviderFactory.makeProvider() as? MockPlayerProviderProtocol
        XCTAssertNotNil(provider, "Invalid provider type")
    }
}
