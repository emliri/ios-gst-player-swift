import UIKit

class Navigation:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.setViewControllers([View()], animated:false)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
