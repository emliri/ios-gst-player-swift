import UIKit

class ViewContent:UIView {
    weak var labelPlaying:UILabel!
    weak var labelTime:UILabel!
    weak var labelDuration:UILabel!
    weak var segmented:UISegmentedControl!
    weak var slider:UISlider!
    
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
        self.makeDuration()
        self.makeSlider()
    }
    
    private func layoutOutlets() {
        self.layoutSegmented()
        self.layoutTime()
        self.layoutDuration()
        self.layoutSlider()
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
    
    private func makePlaying() {
        let labelPlaying:UILabel = UILabel()
        labelPlaying.isUserInteractionEnabled = false
        labelPlaying.translatesAutoresizingMaskIntoConstraints = false
        labelPlaying.backgroundColor = UIColor.clear
        labelPlaying.font = UIFont.systemFont(ofSize:12, weight:UIFont.Weight.light)
        labelPlaying.textColor = UIColor.black
        labelPlaying.numberOfLines = 0
        self.labelPlaying = labelPlaying
        self.addSubview(labelPlaying)
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
    
    private func makeDuration() {
        let labelDuration:UILabel = UILabel()
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.font = UIFont.systemFont(ofSize:20, weight:UIFont.Weight.light)
        labelDuration.textColor = UIColor.black
        labelDuration.textAlignment = NSTextAlignment.center
        self.labelDuration = labelDuration
        self.addSubview(labelDuration)
    }
    
    private func makeSlider() {
        let slider:UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.isContinuous = false
        self.slider = slider
        self.addSubview(slider)
    }
    
    private func layoutSegmented() {
        self.segmented.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.segmented.topAnchor.constraint(equalTo:self.topAnchor, constant:30).isActive = true
        self.segmented.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.segmented.widthAnchor.constraint(equalToConstant:280).isActive = true
    }
    
    private func layoutPlaying() {
        self.labelPlaying.leftAnchor.constraint(equalTo:self.leftAnchor, constant:20).isActive = true
        self.labelPlaying.rightAnchor.constraint(equalTo:self.rightAnchor, constant:20).isActive = true
        self.labelPlaying.bottomAnchor.constraint(equalTo:self.labelTime.topAnchor, constant:-20).isActive = true
        self.labelPlaying.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutTime() {
        self.labelTime.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelTime.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        self.labelTime.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.labelTime.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutDuration() {
        self.labelDuration.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.labelDuration.topAnchor.constraint(equalTo:self.labelTime.bottomAnchor).isActive = true
        self.labelDuration.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.labelDuration.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutSlider() {
        self.slider.leftAnchor.constraint(equalTo:self.leftAnchor, constant:30).isActive = true
        self.slider.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-30).isActive = true
        self.slider.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant:-30).isActive = true
    }
}
