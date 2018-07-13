import Foundation
@testable import AudioPlayer

class MockPlayerProviderProtocol:ProviderProtocol {
    var delegate:ProviderDelegate?
    
    required init() { }
    
    func set(uri:String) {
        
    }
    
    func play() {
        
    }
}
