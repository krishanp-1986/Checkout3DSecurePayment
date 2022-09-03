//
//  CardPayment.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation
import UIKit

struct CardPayment {
  static func build() -> UIViewController {
    let cardPaymentVC = CardPaymentViewController()
    return UINavigationController(rootViewController: cardPaymentVC)
  }
}
