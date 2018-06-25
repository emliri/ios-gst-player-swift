import UIKit

class View:UIViewController {
    let presenter:Presenter
    
    init() {
        self.presenter = Presenter()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = ViewContent()
    }
}
