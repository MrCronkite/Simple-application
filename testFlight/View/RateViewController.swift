

import UIKit
import SnapKit

final class RateViewController: BaseController {
    
    private let containerView = UIView()
    private let titleLable = UILabel()
    private let descriptionLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .activColor
        
        setupText()
    }
}

extension RateViewController {
    override func embedViews() {
        super.embedViews()
        
        view.embedViews(containerView)
        containerView.embedViews(titleLable)
        containerView.embedViews(descriptionLable)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        containerView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).inset(16)
            make.center.equalTo(view.snp.center )
        }
        
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp_topMargin).offset(20)
            make.leading.equalTo(containerView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(containerView.snp_trailingMargin).offset(-16)
        }

        descriptionLable.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp_bottomMargin).offset(16)
            make.leading.equalTo(containerView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(containerView.snp_trailingMargin).offset(-16)
            make.bottom.equalTo(containerView.snp_bottomMargin).offset(-32)
        }
    }
    
    override func setupAppearance() {
        super.setupAppearance()
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        
        titleLable.textColor = .label
        titleLable.font = .systemFont(ofSize: 30, weight: .semibold)
        titleLable.textAlignment = .center
        titleLable.numberOfLines = 0
        
        descriptionLable.textColor = .secondaryLabel
        descriptionLable.numberOfLines = 0
        descriptionLable.textAlignment = .center
        descriptionLable.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func setupText() {
        titleLable.text = "Rate our app"
        descriptionLable.text = "Consequat velit qui adipisicing sunt do reprehenderit ad labotum tempor ullamco exercitation. Ullamco tempory adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit aui adiprising sunt."
    }
}

#Preview {
    RateViewController()
}
