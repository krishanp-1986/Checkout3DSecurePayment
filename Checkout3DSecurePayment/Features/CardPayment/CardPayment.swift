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
    let cardPaymentViewModel = CardPaymentViewModel()
    cardPaymentVC.bindViewModel(cardPaymentViewModel)
    return UINavigationController(rootViewController: cardPaymentVC)
  }
}
