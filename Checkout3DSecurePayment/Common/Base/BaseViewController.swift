//
//  BaseViewController.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import UIKit

class BaseViewController<VM>: UIViewController, BindableType {
  var viewModel: VM!
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = DesignSystem.shared.colors.backgroundPrimary
  }
  
  func bind() {
    assertionFailure("Subclass must override")
  }
  
  func displayBasicAlert(for error: Error) {
    let alertViewController = UIAlertController(
      title: "Error",
      message: error.localizedDescription,
      preferredStyle: .alert
    )
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertViewController.addAction(okAction)
    self.present(alertViewController, animated: true, completion: nil)
  }
}
