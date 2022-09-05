//
//  CardPaymentUseCase.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

protocol CardPaymentUseCase: Service {
  func pay(with data: PaymentRequestBody, whenDone: @escaping (Result<PaymentResponse, ServiceError>) -> Void)
}

struct CheckoutCardPaymentUseCase: CardPaymentUseCase {
  func pay(with data: PaymentRequestBody, whenDone: @escaping (Result<PaymentResponse, ServiceError>) -> Void) {
    guard var request = EndPoint.pay.request else {
      let error = NSError(
        domain: Constants.NSErrorConstants.nsErrorDomain,
        code: Constants.NSErrorConstants.failedRequestErrorCode,
        userInfo: nil
      )
      whenDone(.failure(.generalError(error)))
      return
    }
    
    request.jsonHeader()
    request.requestBody(data)
    dataProvider.execute(request, whenDone: whenDone)
  }
  
  var dataProvider: DataProvider!
}
