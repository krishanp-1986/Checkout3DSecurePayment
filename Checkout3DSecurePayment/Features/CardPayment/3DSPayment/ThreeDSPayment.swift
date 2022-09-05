//
//  ThreeDSPayment.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation
import UIKit

struct ThreeDSPayment {
  static func build(_ url: String, navigationControler: UINavigationController) -> UIViewController {
    var threeDSViewModel = ThreeDSWebViewModel(with: url)
    threeDSViewModel.paymentProcessed = ThreeDSPayment.Router().navigateToPaymentCompleted(navigationControler)
    let threeDSVC = ThreeDSWebViewController()
    threeDSVC.bindViewModel(threeDSViewModel)
    return threeDSVC
  }
}

extension ThreeDSPayment {
  struct Router {
    public var navigateToPaymentCompleted: ((UINavigationController) -> (Bool) -> Void) = { navigationController in
      return { isPaymentSuccess in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          navigationController.present(PaymentComplete.build(isPaymentSuccess), animated: true)
        }
      }
    }
  }
}
