import UIKit

class ViewContent:UIView {
    weak var labelTime:UILabel!
    weak var segmented:UISegmentedControl!
    
    init() {
        super.init(frame:CGRect.zero)
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func makeOutlets() {
        self.makeSegmented()
        self.makeTime()
    }
    
    private func layoutOutlets() {
        self.layoutSegmented()
        self.layoutTime()
    }
    
    private func makeSegmented() {
        let segmented:UISegmentedControl = UISegmentedControl(items:
            [NSLocalizedString("ViewContent_SegmentedNone", comment:String()),
             NSLocalizedString("ViewContent_SegmentedOnline", comment:String()),
             NSLocalizedString("ViewContent_SegmentedLocal", comment:String())])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        self.segmented = segmented
        self.addSubview(segmented)
    }
    
    private func makeTime() {
        let labelTime:UILabel = UILabel()
        labelTime.isUserInteractionEnabled = false
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.backgroundColor = UIColor.clear
        labelTime.font = UIFont.systemFont(ofSize:50, weight:UIFont.Weight.ultraLight)
        labelTime.textColor = UIColor.black
        labelTime.textAlignment = NSTextAlignment.center
        self.labelTime = labelTime
        self.addSubview(labelTime)
    }
    
    private func layoutSegmented() {
        self.segmented.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.segmented.topAnchor.constraint(equalTo:self.topAnchor, constant:30).isActive = true
        self.segmented.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.segmented.widthAnchor.constraint(equalToConstant:280).isActive = true
    }
    
    private func layoutTime() {
        self.labelTime.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelTime.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.labelTime.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.labelTime.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
