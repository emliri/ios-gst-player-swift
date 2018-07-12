import UIKit

class View:UIViewController {
    let presenter:Presenter
    weak var viewContent:ViewContent!
    
    init() {
        self.presenter = Presenter()
        super.init(nibName:nil, bundle:nil)
        self.configureView()
        self.makeActions()
        self.presenter.view = self
    }
    
    required init?(coder:NSCoder) {
        return nil
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
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }
    }
    
    private func makeActions() {
        let actionPlay:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play,
                                                         target:self, action:#selector(self.selectorPlay))
        let actionStop:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop,
                                                         target:self, action:#selector(self.selectorStop))
        let actionPause:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.pause,
                                                          target:self, action:#selector(self.selectorPause))
        let actionNext:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fastForward,
                                                         target:self, action:#selector(self.selectorNext))
        let actionPrevious:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.rewind,
                                                             target:self, action:#selector(self.selectorPrevious))
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                            target:nil, action:nil)
        self.setToolbarItems([actionPrevious, flexibleSpace, actionPause, flexibleSpace, actionStop, flexibleSpace,
                              actionPlay, flexibleSpace, actionNext], animated:false)
    }
    
    @objc private func selectorPlay() {
        self.presenter.interactor.play()
    }
    
    @objc private func selectorStop() {
        
    }
    
    @objc private func selectorPause() {
        
    }
    
    @objc private func selectorNext() {
        
    }
    
    @objc private func selectorPrevious() {
        
    }
}
