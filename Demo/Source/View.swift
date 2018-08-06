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
        self.viewContent.labelTime.text = self.presenter.viewModel.currentTime
        self.viewContent.labelDuration.text = self.presenter.viewModel.currentDuration
        self.viewContent.slider.isHidden = self.presenter.viewModel.sliderHidden
        self.viewContent.slider.value = self.presenter.viewModel.sliderValue
        self.viewContent.slider.maximumValue = self.presenter.viewModel.sliderMaxValue
        self.toolbar.buttonPlay.isEnabled = self.presenter.viewModel.buttonPlayEnabled
        self.toolbar.buttonStop.isEnabled = self.presenter.viewModel.buttonStopEnabled
        self.toolbar.buttonPause.isEnabled = self.presenter.viewModel.buttonPauseEnabled
        self.toolbar.buttonNext.isEnabled = self.presenter.viewModel.buttonNextEnabled
        self.toolbar.buttonPrevious.isEnabled = self.presenter.viewModel.buttonPreviousEnabled
    }
    
    override func loadView() {
        let view:ViewContent = ViewContent()
        view.backgroundColor = UIColor.white
        view.segmented.addTarget(self, action:#selector(self.selector(segmented:)), for:UIControlEvents.valueChanged)
        view.slider.addTarget(self, action:#selector(self.selector(slider:)), for:UIControlEvents.valueChanged)
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
        self.presenter.viewModel.buttonPlayEnabled = true
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        }
    }
    
    @objc private func selector(segmented:UISegmentedControl) {
        self.presenter.clearPlayList()
        switch segmented.selectedSegmentIndex {
        case 1:
            self.presenter.setPlay(list:[Constants.remote])
        case 2:
            let list:[String] = Constants.list.map { (item:String) -> String in
                return Bundle.main.url(forResource:item, withExtension:nil)!.absoluteString
            }
            self.presenter.setPlay(list:list)
        default:
            self.presenter.removeSource()
        }
    }
    
    @objc private func selector(slider:UISlider) {
        self.presenter.seek(seconds:slider.value)
    }
}
