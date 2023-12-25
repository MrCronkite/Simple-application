

import UIKit

extension UIColor {
    
    static let brightLilac = UIColor(r: 210, g: 86, b: 255)
    static let dividersContainer = UIColor(named: "dividers_container") ?? UIColor(r: 220, g: 218, b: 233)
    static let activColor = UIColor(named: "activ") ?? UIColor(r: 220, g: 210, b: 100)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, _ a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    func renderImage(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
