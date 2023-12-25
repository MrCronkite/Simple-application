

import UIKit

class BaseController: UIViewController {
    
   private var loadingView: LoadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createLoadingView()
        
        embedViews()
        setupLayout()
        setupAppearance()
    }
}
 
@objc extension BaseController {
    func createLoadingView() {
        loadingView = LoadingView.instantiate()
        loadingView.layer.zPosition = 2
        loadingView.frame = view.bounds
        view.addSubview(loadingView)
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func showLoading() {
        loadingView.start()
    }
    
    func hideLoading() {
        loadingView.finish()
    }
    
    func embedViews() {}
    
    func setupLayout() {}
    
    func setupAppearance() {
        view.backgroundColor = .activColor
    }
}


