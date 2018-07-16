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
        let stop:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:self,
                                                   action:#selector(self.selectorStop))
        let pause:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.pause, target:self,
                                                    action:#selector(self.selectorPause))
        let next:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fastForward, target:self,
                                                   action:#selector(self.selectorNext))
        let previous:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.rewind, target:self,
                                                       action:#selector(self.selectorPrevious))
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                            target:nil, action:nil)
        self.items = [previous, space, pause, space, stop, space, play, space, next]
        self.buttonPlay = play
        self.buttonStop = stop
        self.buttonPause = pause
        self.buttonNext = next
        self.buttonPrevious = previous
    }
    
    @objc private func selectorPlay() {
        self.presenter.play()
    }
    
    @objc private func selectorStop() {
        self.presenter.stop()
    }
    
    @objc private func selectorPause() {
        self.presenter.pause()
    }
    
    @objc private func selectorNext() { }
    @objc private func selectorPrevious() { }
}
