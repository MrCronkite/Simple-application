

import UIKit

class BaseView: UIView, NibLoadableView {
    
    @IBOutlet var sizeConstraints: [NSLayoutConstraint]!
    @IBOutlet var resizeFontViews: [UIView]!
    
    private var currentMode: UIUserInterfaceStyle?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        currentMode = overrideUserInterfaceStyle
        if let constraints = sizeConstraints, !constraints.isEmpty {
            sizeConstraints.forEach { $0.scaled() }
        }
        if let views = resizeFontViews, !views.isEmpty {
            UIView.updateFonts(views: views)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle != currentMode {
            currentMode = userInterfaceStyle
            
            modeDidChange()
        }
    }
    
    func modeDidChange() {}
    
}

