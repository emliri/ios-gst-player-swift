import UIKit

class ViewContent:UIView {
    weak var viewTime:ViewListItem!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.groupTableViewBackground
    }
    
    private func makeOutlets() {
        self.makeTime()
    }
    
    private func layoutOutlets() {
        self.layoutItem(viewItem:self.viewTime, topAnchor:self.topAnchor)
    }
    
    private func makeTime() {
        let viewTime:ViewListItem = ViewListItem()
        viewTime.labelTitle.text = NSLocalizedString("ViewTime_Title", comment:String())
        self.viewTime = viewTime
        self.addSubview(viewTime)
    }
    
    private func layoutItem(viewItem:ViewListItem, topAnchor:NSLayoutYAxisAnchor) {
        viewItem.topAnchor.constraint(equalTo:topAnchor, constant:ViewConstants.ListItem.top).isActive = true
        viewItem.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        viewItem.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        viewItem.heightAnchor.constraint(equalToConstant:ViewConstants.ListItem.height).isActive = true
    }
}
