

import UIKit.UIFont

extension UIFont {
    
    var weight: UIFont.Weight {
        switch true {
        case fontName.contains("Semibold"):
            return .semibold
        case fontName.contains("Bold"):
            return .bold
        case fontName.contains("Medium"):
            return .medium
        default:
            return .regular
        }
    }
    
    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func semibold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func black(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .black)
    }
    
}
