import Foundation
@testable import AudioPlayer

class MockProviderProtocol:ProviderProtocol {
    var delegate:ProviderDelegate?
    
    required init() { }
    
    func set(uri:String) {
        
    }
    
    func play() {
        
    }
}
