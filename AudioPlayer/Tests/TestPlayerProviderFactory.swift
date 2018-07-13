import XCTest
@testable import AudioPlayer

class TestPlayerProviderFactory:XCTestCase {
    func testMakeNewProviderReturnsNotNil() {
        let provider:ProviderProtocol? = ProviderFactory.makeProvider()
        XCTAssertNotNil(provider, "Failed to make a provider")
    }
    
    func testUseTypeFromStaticVar() {
        ProviderFactory.providerType = MockPlayerProviderProtocol.self
        let provider:MockPlayerProviderProtocol? = ProviderFactory.makeProvider() as? MockPlayerProviderProtocol
        XCTAssertNotNil(provider, "Invalid provider type")
    }
}
