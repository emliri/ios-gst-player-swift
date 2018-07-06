import Foundation
@testable import AudioPlayer

class MockPlayerProviderProtocol:PlayerProviderProtocol {
    var delegate:PlayerProviderDelegate?
    
    required init() { }
    
    func set(uri:String) {
        
    }
    
    func play() {
        
    }
}
