import UIKit

class ViewToolbar {
    weak var presenter:Presenter!
    weak var buttonPlay:UIBarButtonItem!
    weak var buttonStop:UIBarButtonItem!
    weak var buttonPause:UIBarButtonItem!
    weak var buttonNext:UIBarButtonItem!
    weak var buttonPrevious:UIBarButtonItem!
    private(set) var items:[UIBarButtonItem]!
    
    init() {
        self.buttonPlay = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play, target:self,
                                          action:#selector(self.selectorPlay))
        self.buttonStop = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:self,
                                          action:#selector(self.selectorStop))
        self.buttonPause = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.pause, target:self,
                                           action:#selector(self.selectorPause))
        self.buttonNext = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fastForward, target:self,
                                          action:#selector(self.selectorNext))
        self.buttonPrevious = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.rewind, target:self,
                                              action:#selector(self.selectorPrevious))
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                            target:nil, action:nil)
        self.items = [self.buttonPrevious, flexibleSpace, self.buttonPause, flexibleSpace, self.buttonStop,
                      flexibleSpace, self.buttonPlay, flexibleSpace, self.buttonNext]
    }
    
    @objc private func selectorPlay() {
        self.presenter.play()
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
