

import UIKit

extension CGFloat {
    
    var roundUpToInteger: Int {
        return Int(rounded(.up))
    }
    
    var roundDownToInteger: Int {
        return Int(rounded(.down))
    }
    
    var scaled: CGFloat {
        guard self != 1.0 else { return Swift.max(1.0, 1.0.scaled) }
        return CGFloat((self * UIScreen.diff).roundUpToInteger)
    }
    
    var premiumScaled: CGFloat {
        guard UIScreen.hasBottomButton else { return self }
        return CGFloat((self * 0.85).roundUpToInteger)
    }
    
    var designScaled: CGFloat {
        guard UIScreen.hasBottomButton else { return self * CGFloat(Swift.min(1.0, UIScreen.screenRect.height / 812)) }
        return premiumScaled
    }
    
    var fullScaled: CGFloat {
        guard self != 1.0 else { return Swift.max(1.0, 1.0.scaled) }
        return CGFloat((self * UIScreen.fullDiff).roundUpToInteger)
    }
    
}
