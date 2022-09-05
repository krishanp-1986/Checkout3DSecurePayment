//
//  BindableType.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation
import UIKit

protocol BindableType: AnyObject {
  associatedtype ViewModelType
  var viewModel: ViewModelType! { get set }
  func bind()
}

extension BindableType where Self: UIViewController {
  func bindViewModel(_ viewModel: ViewModelType) {
    self.viewModel = viewModel
    bind()
  }
}
