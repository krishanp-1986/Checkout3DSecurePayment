//
//  UIStackView.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation
import UIKit

extension UIStackView {
  func removeAllSubviews() {
    self.arrangedSubviews.forEach {
      removeArrangedSubview($0)
      $0.removeFromSuperview()
    }
  }
}
