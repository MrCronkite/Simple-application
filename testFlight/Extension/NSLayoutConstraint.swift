

import UIKit.NSLayoutConstraint

extension NSLayoutConstraint {
    
    func scaled() {
        self.constant = CGFloat((self.constant * UIScreen.diff).roundUpToInteger)
    }
    
    func premiumScaled() {
        self.constant = CGFloat((self.constant * 0.85).roundUpToInteger)
    }
    
    func fullScaled() {
        self.constant = CGFloat((self.constant * UIScreen.fullDiff).roundUpToInteger)
    }
    
}
