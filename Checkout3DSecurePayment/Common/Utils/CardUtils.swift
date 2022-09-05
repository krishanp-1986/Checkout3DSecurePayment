//
//  CardUtils.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

struct CardUtils {
  static func getCardType(_ number: String?) -> CreditCardType? {
    guard let cardNumber = number else { return nil }
    return CreditCardType.allCases.first { type in
      cardNumber.range(of: type.regex, options: .regularExpression) != nil
    }
  }
  
  static func luhnCheck(_ number: String) -> Bool {
    if number.isEmpty {
      return false
    }
    var sum = 0
    let digitStrings = number.reversed().map { String($0) }
    
    for tuple in digitStrings.enumerated() {
      if let digit = Int(tuple.element) {
        let odd = tuple.offset % 2 == 1
        
        switch (odd, digit) {
        case (true, 9):
          sum += 9
        case (true, 0...8):
          sum += (digit * 2) % 9
        default:
          sum += digit
        }
      } else {
        return false
      }
    }
    return sum % 10 == 0
  }
}
