

import UIKit

class BaseController: UIViewController {
    
    var loadingView: LoadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createLoadingView()
    }
}
 
extension BaseController {
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
}

