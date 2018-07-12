import UIKit

class ViewListItem:UIView {
    weak var labelTitle:UILabel!
    weak var labelValue:UILabel!
    
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
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
    }
    
    private func makeOutlets() {
        self.makeTitle()
        self.makeValue()
    }
    
    private func layoutOutlets() {
        self.layoutTitle()
        self.layoutValue()
    }
    
    private func makeTitle() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:ViewConstants.ListItem.titleFontSize, weight:UIFont.Weight.bold)
        label.textColor = UIColor.black
        self.labelTitle = label
        self.addSubview(label)
    }
    
    private func makeValue() {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize:ViewConstants.ListItem.valueFontSize, weight:UIFont.Weight.light)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.right
        self.labelValue = label
        self.addSubview(label)
    }
    
    private func layoutTitle() {
        self.labelTitle.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.labelTitle.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor,
                                              constant:ViewConstants.ListItem.margin).isActive = true
        self.labelTitle.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutValue() {
        self.labelValue.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.labelValue.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.labelValue.rightAnchor.constraint(equalTo:self.rightAnchor,
                                              constant:-ViewConstants.ListItem.margin).isActive = true
        self.labelValue.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
