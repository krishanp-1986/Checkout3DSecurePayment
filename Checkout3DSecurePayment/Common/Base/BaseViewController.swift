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
}
