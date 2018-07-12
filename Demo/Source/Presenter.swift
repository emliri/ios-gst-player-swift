import Foundation

class Presenter {
    weak var view:View!
    let interactor:Interactor
    private let numberFormatter:NumberFormatter
    
    init() {
        self.interactor = Interactor()
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.numberStyle = NumberFormatter.Style.decimal
        self.interactor.presenter = self
    }
    
    func update(time:Float) {
        guard
            let timeString:String = self.numberFormatter.string(from:NSNumber(value:time))
        else { return }
        self.view.viewContent.viewTime.labelValue.text = timeString
    }
}
