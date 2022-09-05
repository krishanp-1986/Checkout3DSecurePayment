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
    let navigationController = UINavigationController()
    let useCase = ServiceFactory.useCaseFor(CheckoutCardPaymentUseCase.self)
    let cardPaymentVC = CardPaymentViewController()
    var cardPaymentViewModel = CardPaymentViewModel(with: useCase)
    cardPaymentViewModel.navigateToWebView = CardPayment.Router().didReceive3DSUrl(navigationController)
    cardPaymentVC.bindViewModel(cardPaymentViewModel)
    navigationController.viewControllers = [cardPaymentVC]
    return navigationController
  }
}

extension CardPayment {
  struct Router {
    public var didReceive3DSUrl: ((UINavigationController) -> (String) -> Void) = { navigationController in
      return { url in
        navigationController.present(
          ThreeDSPayment.build(
            url,
            navigationControler: navigationController
          ),
          animated: true
        )
      }
    }
  }
}
