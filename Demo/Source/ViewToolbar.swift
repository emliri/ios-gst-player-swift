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
        let play:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play, target:self,
                                                   action:#selector(self.selectorPlay))
        self.buttonPlay = play
        
        let stop:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:self,
                                                   action:#selector(self.selectorStop))
        self.buttonStop = stop
        
        let pause:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.pause, target:self,
                                                    action:#selector(self.selectorPause))
        self.buttonPause = pause
        
        let next:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fastForward, target:self,
                                                   action:#selector(self.selectorNext))
        self.buttonNext = next
        let previous:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.rewind, target:self,
                                                       action:#selector(self.selectorPrevious))
        self.buttonPrevious = previous
        
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                            target:nil, action:nil)
        
        self.items = [previous, flexibleSpace, pause, flexibleSpace, stop, flexibleSpace, play, flexibleSpace,
                      self.buttonNext]
    }
    
    @objc private func selectorPlay() {
        self.presenter.play()
    }
    
    @objc private func selectorStop() {
        
    }
    
    @objc private func selectorPause() {
        self.presenter.pause()
    }
    
    @objc private func selectorNext() {
        
    }
    
    @objc private func selectorPrevious() {
        
    }
}
