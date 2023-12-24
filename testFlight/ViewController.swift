

import UIKit

class ViewController: UIViewController {
    
    var loadingView: LoadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createLoadingView()
        
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
        }
    }
}
 
extension ViewController {
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

