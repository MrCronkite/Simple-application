

import UIKit

import UIKit.UIView

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    static func instantiate() -> Self {
        return Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! Self
    }
}

enum AddingViewType {
    case add
    case insertAbove(UIView)
    case insertBelow(UIView)
    case insertAt(Int)
}

enum Anchor {
    case left(CGFloat, UIView, Bool)
    case leading(CGFloat, UIView, Bool)
    case trailing(CGFloat, UIView, Bool)
    case right(CGFloat, UIView, Bool)
    case bottom(CGFloat, UIView, Bool)
    case top(CGFloat, UIView, Bool)
    case centerX(CGFloat, UIView, Bool)
    case centerY(CGFloat, UIView, Bool)
    case width(CGFloat)
    case height(CGFloat)
    case rightToLeft(CGFloat, UIView, Bool)
    case rightMore(CGFloat, UIView, Bool)
    case bottomTop(CGFloat, UIView, Bool)

    static func toParent(_ view: UIView) -> [Anchor] {
        return [.left(0, view, true), .right(0, view, true), .bottom(0, view, true), .top(0, view, true)]
    }

    static func toBorders(_ view: UIView) -> [Anchor] {
        return [.leading(0, view, false), .trailing(0, view, false), .bottom(0, view, false), .top(0, view, false)]
    }
}

extension UIView {
    
    var topSuperview: UIView? {
        guard var top = superview else { return nil }
        while let superview = top.superview {
            top = superview
        }
        return top
    }
    
    func embedViews(_ view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    func border(width: CGFloat = 0, color: UIColor? = nil, radius: CGFloat = 0) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func applyShadow(corner: CGFloat = 0.0, opacity: Float = 0.1, shadow: CGFloat = 10.0, color: UIColor = UIColor.brightLilac, offset: CGSize = CGSize(width: 0, height: 6)) {
        layer.masksToBounds = false
        layer.borderWidth = 0.0
        layer.cornerRadius = corner
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadow
        layer.shadowOffset = offset
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, rect: CGRect? = nil) {
        let rect = rect ?? self.bounds
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    @discardableResult func append(to parent: UIView, anchors: [Anchor], type: AddingViewType = .add) -> [NSLayoutConstraint] {
        switch type {
        case .add:
            parent.addSubview(self)
        case let .insertAt(index):
            parent.insertSubview(self, at: index)
        case let .insertAbove(view):
            parent.insertSubview(self, aboveSubview: view)
        case let .insertBelow(view):
            parent.insertSubview(self, belowSubview: view)
        }
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = anchors
        if anchors.isEmpty {
            anchors = Anchor.toParent(parent)
        }
        let layoutGuide: UILayoutGuide = parent.safeAreaLayoutGuide

        let constraints: [NSLayoutConstraint] = anchors.compactMap {
            switch $0 {
            case let .leading(indent, view, _):
                return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: indent)
            case let .trailing(indent, view, _):
                return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: indent)
            case let .left(indent, view, _):
                return leftAnchor.constraint(equalTo: view.leftAnchor, constant: indent)
            case let .right(indent, view, _):
                return rightAnchor.constraint(equalTo: view.rightAnchor, constant: indent)
            case let .rightMore(indent, view, _):
                return trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: indent)
            case let .rightToLeft(indent, view, _):
                return leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: indent)
            case let .bottom(indent, view, toGuide):
                let anchor = toGuide ? layoutGuide.bottomAnchor : view.bottomAnchor
                return bottomAnchor.constraint(equalTo: anchor, constant: indent)
            case let .bottomTop(indent, view, _):
                return bottomAnchor.constraint(equalTo: view.topAnchor, constant: indent)
            case let .top(indent, view, toGuide):
                let anchor = toGuide ? layoutGuide.topAnchor : view.topAnchor
                return topAnchor.constraint(equalTo: anchor, constant: indent)
            case let .centerX(indent, view, toGuide):
                let anchor = toGuide ? layoutGuide.centerXAnchor : view.centerXAnchor
                return centerXAnchor.constraint(equalTo: anchor, constant: indent)
            case let .centerY(indent, view, toGuide):
                let anchor = toGuide ? layoutGuide.centerYAnchor : view.centerYAnchor
                return centerYAnchor.constraint(equalTo: anchor, constant: indent)
            case let .width(value):
                return widthAnchor.constraint(equalToConstant: value)
            case let .height(value):
                return heightAnchor.constraint(equalToConstant: value)
            }
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    static func updateFonts(views: [UIView]) {
        views.forEach {
            if let label = $0 as? UILabel {
                label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: label.font.weight)
            }
            if let textField = $0 as? UITextField, let font = textField.font {
                textField.font = UIFont.systemFont(ofSize: font.pointSize,
                                                   weight: font.weight)
            }
            if let button = $0 as? UIButton, let font = button.titleLabel?.font {
                button.titleLabel?.font = UIFont.systemFont(ofSize: font.pointSize,
                                                            weight: font.weight)
            }
            if let textView = $0 as? UITextView, let font = textView.font {
                textView.font = UIFont.systemFont(ofSize: font.pointSize,
                                                  weight: font.weight)
            }
        }
    }
    
    static func scaleFonts(views: [UIView]) {
        views.forEach {
            if let label = $0 as? UILabel {
                label.font = UIFont.systemFont(ofSize: label.font.pointSize.premiumScaled, weight: label.font.weight)
            }
            if let textField = $0 as? UITextField, let font = textField.font {
                textField.font = UIFont.systemFont(ofSize: font.pointSize.premiumScaled,
                                                   weight: font.weight)
            }
            if let button = $0 as? UIButton, let font = button.titleLabel?.font {
                button.titleLabel?.font = UIFont.systemFont(ofSize: font.pointSize.premiumScaled,
                                                            weight: font.weight)
            }
            if let textView = $0 as? UITextView, let font = textView.font {
                textView.font = UIFont.systemFont(ofSize: font.pointSize.premiumScaled,
                                                  weight: font.weight)
            }
        }
    }
    
}
