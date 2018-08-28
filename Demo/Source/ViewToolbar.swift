import UIKit

class ViewToolbar {
    weak var buttonPlay:UIBarButtonItem!
    weak var buttonStop:UIBarButtonItem!
    weak var buttonPause:UIBarButtonItem!
    weak var buttonNext:UIBarButtonItem!
    weak var buttonPrevious:UIBarButtonItem!
    private(set) var items:[UIBarButtonItem]!
    
    init(presenter:Presenter) {
        let play:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.play, target:presenter,
                                                   action:#selector(presenter.play))
        let stop:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.stop, target:presenter,
                                                   action:#selector(presenter.stop))
        let pause:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.pause, target:presenter,
                                                    action:#selector(presenter.pause))
        let next:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fastForward,
                                                   target:presenter, action:#selector(presenter.next))
        let previous:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.rewind,
                                                       target:presenter, action:#selector(presenter.previous))
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace,
                                                            target:nil, action:nil)
        self.items = [previous, space, pause, space, stop, space, play, space, next]
        self.buttonPlay = play
        self.buttonStop = stop
        self.buttonPause = pause
        self.buttonNext = next
        self.buttonPrevious = previous
    }
}
