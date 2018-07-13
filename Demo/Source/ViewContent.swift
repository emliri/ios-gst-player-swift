import UIKit

class ViewContent:UIView {
    weak var labelTime:UILabel!
    
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
    }
    
    private func makeOutlets() {
        self.makeTime()
    }
    
    private func layoutOutlets() {
        self.layoutTime()
    }
    
    private func makeTime() {
        let labelTime:UILabel = UILabel()
        labelTime.isUserInteractionEnabled = false
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.backgroundColor = UIColor.clear
        labelTime.font = UIFont.systemFont(ofSize:40, weight:UIFont.Weight.ultraLight)
        labelTime.textColor = UIColor.black
        labelTime.textAlignment = NSTextAlignment.center
        self.labelTime = labelTime
        self.addSubview(labelTime)
    }
    
    private func layoutTime() {
        self.labelTime.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelTime.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.labelTime.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.labelTime.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
}
