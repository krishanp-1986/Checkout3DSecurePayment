//
//  ThreeDSPaymentProtocoal.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

protocol ThreeDSPaymentProtocol {
  init(with paymentUrl: String, successRiderect: String, failureRedirect: String)
  func fetchPaymentUrl() -> URL?
  func shouldRedirectBack(_ redirectUrl: String) -> Bool
  var paymentProcessed: ((Bool) -> Void)? { get }
}

struct ThreeDSWebViewModel: ThreeDSPaymentProtocol {
  private let urlFor3dsPayment: String
  private let successUrl: String
  private let failureUrl: String
  var paymentProcessed: ((Bool) -> Void)?

  init(with paymentUrl: String, successRiderect: String = Constants.successUrl, failureRedirect: String = Constants.failureUrl) {
    self.urlFor3dsPayment = paymentUrl
    self.successUrl = successRiderect
    self.failureUrl = failureRedirect
  }
  
  func fetchPaymentUrl() -> URL? {
    URL(string: urlFor3dsPayment)
  }
  
  func shouldRedirectBack(_ redirectUrl: String) -> Bool {
    if redirectUrl.contains(self.successUrl) {
      self.paymentProcessed?(true)
      return true
    }
    
    if redirectUrl.contains(self.failureUrl) {
      self.paymentProcessed?(false)
      return true
    }
    
    return false
  }
}
