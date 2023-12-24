

import UIKit

extension Double {
    
    var roundUpToInteger: Int {
        return Int(rounded(.up))
    }
    
    var roundDownToInteger: Int {
        return Int(rounded(.down))
    }
    
    var isValid: Bool {
        return !isInfinite && !isNaN
    }
    
    var scaled: CGFloat {
        guard self != 1.0 else { return max(1.0, 1.0 * UIScreen.diff) }
        return CGFloat((CGFloat(self) * UIScreen.diff).roundUpToInteger)
    }
    
    var premiumScaled: CGFloat {
        guard UIScreen.hasBottomButton else { return self }
        
        return CGFloat((self * 0.85).roundUpToInteger)
    }
    
    var designScaled: CGFloat {
        guard UIScreen.hasBottomButton else { return self + max(0.0, (UIScreen.screenRect.height - 812) / 2.0) }
        return premiumScaled
    }
    
    var fullScaled: CGFloat {
        guard self != 1.0 else { return Swift.max(1.0, 1.0.scaled) }
        return CGFloat((CGFloat(self) * UIScreen.fullDiff).roundUpToInteger)
    }
    
}

