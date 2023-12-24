

import UIKit

extension UIScreen {
    
    private static var defaultWidth: CGFloat {
        return 375.0 - widthInset
    }
    
    private static var defaultHeight: CGFloat {
        return 667.0 - heightInset
    }
    
    static var defaultScale: CGFloat {
        return UIScreen.main.scale
    }
    
    static var screenRect: CGRect {
        return UIScreen.main.bounds
    }
    
    static var screenWidth: CGFloat {
        return screenRect.width - widthInset
    }
    
    static var screenHeight: CGFloat {
        return screenRect.height - heightInset
    }
    
    private static var widthInset: CGFloat {
        return windowInsets.left + windowInsets.right
    }
    
    static var heightInset: CGFloat {
        return windowInsets.top + windowInsets.bottom
    }
    
    static var hasBottomButton: Bool {
        return windowInsets.bottom < 20
    }
    
    static var windowInsets: UIEdgeInsets {
        #if REPOST
        guard #available(iOS 11.0, *),
              let insets = UIApplication.shared.keyWindow?.safeAreaInsets else { return .zero }
        return insets
        #else
        return .zero
        #endif
    }
    
    private static var diffBetweenIpadAndIphone: CGFloat {
        let currentRatio: CGFloat = min(screenWidth, screenHeight) / max(screenWidth, screenHeight)
        let defaultRatio: CGFloat = UIScreen.defaultWidth / UIScreen.defaultHeight
        
        let diffCoeff: CGFloat = max(currentRatio - defaultRatio, 0)
        return diffCoeff
    }
    
    static var diff: CGFloat {
        let diffSide = min(screenWidth, screenHeight) - min(screenWidth, screenHeight) * diffBetweenIpadAndIphone
        let value = diffSide / defaultWidth
        return min(value, 1.5)
    }
    
    static var fullDiff: CGFloat {
        let value = min(screenWidth, screenHeight) / defaultWidth
        return value
    }
    
}
