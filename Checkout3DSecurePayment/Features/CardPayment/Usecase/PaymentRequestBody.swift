//
//  PaymentRequestBody.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

struct PaymentRequestBody: Encodable {
  let number: String?
  let expiryMonth: Int?
  let expiryYear: Int?
  let cvv: String?
  let successUrl: String? 
  let failureUrl: String?
  
  enum CodingKeys: String, CodingKey {
    case number, cvv
    case expiryMonth = "expiry_month"
    case expiryYear = "expiry_year"
    case successUrl = "success_url"
    case failureUrl = "failure_url"
  }

  static func convertDict(_ dictionary: [String: Any]) -> PaymentRequestBody {
    PaymentRequestBody(
      number: dictionary["number"] as? String,
      expiryMonth: dictionary["expiry_month"] as? Int,
      expiryYear: dictionary["expiry_year"] as? Int,
      cvv: dictionary["cvv"] as? String,
      successUrl: dictionary["success_url"] as? String,
      failureUrl: dictionary["failure_url"] as? String
    )
  }
}

struct PaymentResponse: Decodable {
  let url: String
}
