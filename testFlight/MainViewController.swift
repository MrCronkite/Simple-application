

import SnapKit
import UIKit

final class MainViewController: BaseController {
    
    private let alertView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let alertButton = UIButton()
    private let alertSecondaryButton = UIButton()
    
    override func viewDidLoad() {
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
    }
}

private extension MainViewController {
    func embedViews() {
        view.embedViews(alertView)
        
        alertView.embedViews(titleLabel)
        alertView.embedViews(descriptionLabel)
        alertView.embedViews(alertButton)
        alertView.embedViews(alertSecondaryButton)
    }
    
    func setupLayout() {
        alertView.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp_centerYWithinMargins).offset(0)
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(alertView.snp_topMargin).offset(32)
            make.leading.equalTo(alertView.snp_leadingMargin).offset(51)
            make.trailing.equalTo(alertView.snp_trailingMargin).offset(-49)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(16)
            make.leading.equalTo(alertView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(alertView.snp_trailingMargin).offset(-16)
        }
        
        alertButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp_bottomMargin).offset(45)
            make.leading.equalTo(alertView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(alertView.snp_trailingMargin).offset(-16)
            make.height.equalTo(51)
        }
        
        alertSecondaryButton.snp.makeConstraints { make in
            make.top.equalTo(alertButton.snp_bottomMargin).offset(18)
            make.leading.equalTo(alertView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(alertView.snp_trailingMargin).offset(-16)
            make.bottom.equalTo(alertView.snp_bottomMargin).offset(-32)
        }
        
    }
    
    func setupAppearance() {
        view.backgroundColor = .activColor
        
        alertView.backgroundColor = .white
        alertView.layer.cornerRadius = 10
        
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.backgroundColor = .activ
        alertButton.layer.cornerRadius = 25
        
        alertSecondaryButton.setTitleColor(.activ, for: .normal)
    }
    
    func setupData() {
        titleLabel.text = "Congratulations!"
        
        descriptionLabel.text = "Consequat velit qui adipisicing sunt do reprehenderit ad labotum tempor ullamco exercitation. Ullamco tempory adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit aui adiprising sunt."
        
        alertButton.setTitle("Click me", for: .normal)
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        alertSecondaryButton.setTitle("Secondary Action", for: .normal)
    }
}

@objc extension MainViewController {
    func alertAction() {
        print("hello")
    }
}

