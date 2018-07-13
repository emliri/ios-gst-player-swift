import UIKit

class View:UIViewController {
    let presenter:Presenter
    weak var viewContent:ViewContent!
    private let toolbar:ViewToolbar
    
    init() {
        self.presenter = Presenter()
        self.toolbar = ViewToolbar()
        super.init(nibName:nil, bundle:nil)
        self.configureView()
        self.presenter.view = self
        self.toolbar.presenter = self.presenter
        self.setToolbarItems(self.toolbar.items, animated:false)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateViewModel() {
        self.viewContent.viewTime.labelValue.text = self.presenter.viewModel.currentTime
    }
    
    override func loadView() {
        let view:ViewContent = ViewContent()
        self.viewContent = view
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated:true)
        self.navigationController?.setToolbarHidden(false, animated:true)
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.presenter.playerUpdated(position:0)
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }
    }
}
