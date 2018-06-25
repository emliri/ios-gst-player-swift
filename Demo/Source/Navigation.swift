import UIKit

class Navigation:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.setViewControllers([View()], animated:false)
        self.configureNavigationBar()
        self.configureToolbar()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureNavigationBar() {
        self.navigationBar.backgroundColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }
    }
    
    private func configureToolbar() {
        self.toolbar.backgroundColor = UIColor.white
        self.toolbar.barTintColor = UIColor.white
        self.toolbar.tintColor = UIColor.black
        self.toolbar.isTranslucent = false
    }
}
