//
//  CardPaymentViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

protocol CardPaymentViewModelProtocol {
  init(with useCase: CardPaymentUseCase)
  var navigateToWebView: ((String) -> Void)? { get }
  var updateViewBasedOn: ((CardPaymentViewModel.State) -> Void)? { get set }
  func fetchFormModels() -> [InputViewDataProvidable]
  func submitPayment(_ details: [String: Any])
}

struct CardPaymentViewModel: CardPaymentViewModelProtocol {
  private let useCase: CardPaymentUseCase
  init(with useCase: CardPaymentUseCase) {
    self.useCase = useCase
  }
  var updateViewBasedOn: ((CardPaymentViewModel.State) -> Void)?
  var navigateToWebView: ((String) -> Void)?
  func fetchFormModels() -> [InputViewDataProvidable] {
    // Expiry CVV Viewmodel
    let expiryCVVViewModel = ExpiryCVVViewModel()
    
    // Credit Card number viewmodel
    let creditCardInputViewModel = CreditCardInputViewModel()
    creditCardInputViewModel.cardTypeListener = { type in
      expiryCVVViewModel.maxCharacterCount = type?.cvvLength
      self.updateViewBasedOn?(.cardDetected(type))
    }
    
    return [creditCardInputViewModel, expiryCVVViewModel]
  }
  
  func submitPayment(_ details: [String: Any]) {
    var paymentDetails = details
    paymentDetails["success_url"] = Constants.successUrl
    paymentDetails["failure_url"] = Constants.failureUrl
    self.useCase.pay(with: PaymentRequestBody.convertDict(paymentDetails)) { result in
      switch result {
      case .success(let paymentResponse):
        self.navigateToWebView?(paymentResponse.url)
        self.updateViewBasedOn?(.redirected)
      case .failure(let error):
        self.updateViewBasedOn?(.error(error))
      }
    }
  }
}

extension CardPaymentViewModel {
  // Viewmodel acts like state machine
  enum State {
    case cardDetected(CreditCardType?)
    case redirected
    case error(Error)
  }
}
