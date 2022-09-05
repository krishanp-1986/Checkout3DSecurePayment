//
//  ThreeDSWebViewController.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import UIKit
import WebKit

class ThreeDSWebViewController: BaseViewController<ThreeDSPaymentProtocol>, WKNavigationDelegate {
  lazy var webView: WKWebView = {
    let webView = WKWebView()
    webView.navigationDelegate = self
    return webView
  }()
  
  override func loadView() {
    super.loadView()
    self.view = webView
  }
  
  override func bind() {
    guard let paymentUrl = self.viewModel.fetchPaymentUrl() else {
      return
    }
    webView.load(URLRequest(url: paymentUrl))
    webView.allowsBackForwardNavigationGestures = true
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    if let redirectedUrl = navigationAction.request.url?.absoluteString {
      if self.viewModel.shouldRedirectBack(redirectedUrl) {
        self.dismiss(animated: true)
      }
    }
    decisionHandler(.allow)
  }
}
