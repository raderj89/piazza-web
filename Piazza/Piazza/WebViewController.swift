import UIKit
import WebKit
import Turbo
import Strada

class WebViewController: VisitableViewController, BridgeDestination {
    private lazy var bridgeDelegate: BridgeDelegate = {
        BridgeDelegate(
            location: visitableURL.absoluteString,
            destination: self,
            componentTypes: BridgeComponent.allTypes
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDismissButton()
        bridgeDelegate.onViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bridgeDelegate.onViewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bridgeDelegate.onViewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bridgeDelegate.onViewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        bridgeDelegate.onViewDidDisappear()
    }
    
    // MARK: Visitable

    override func visitableDidActivateWebView(_ webView: WKWebView) {
        bridgeDelegate.webViewDidBecomeActive(webView)
    }
    
    override func visitableDidDeactivateWebView() {
        bridgeDelegate.webViewDidBecomeDeactivated()
    }
    
    override func visitableDidRender() {
        navigationItem.title = visitableView.webView?.title
    }
    // MARK: private

    private func configureDismissButton() {
        if presentingViewController != nil {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .close,
                target: self,
                action: #selector(dismissModal)
            )
        }
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }
}
