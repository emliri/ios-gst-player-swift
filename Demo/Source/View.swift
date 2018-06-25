import UIKit

class View:UIViewController {
    let presenter:Presenter
    
    init() {
        self.presenter = Presenter()
        super.init(nibName:nil, bundle:nil)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = ViewContent()
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }
    }
}
