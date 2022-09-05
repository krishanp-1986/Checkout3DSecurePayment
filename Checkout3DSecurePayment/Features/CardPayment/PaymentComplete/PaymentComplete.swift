//
//  PaymentComplete.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation
import UIKit

struct PaymentComplete {
  static func build(_ isPaymentSuccess: Bool) -> UIViewController {
    return PaymentCompleteViewController(with: isPaymentSuccess)
  }
}
