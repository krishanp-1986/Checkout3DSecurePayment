//
//  CreditCardType.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

public enum CreditCardType: String, CaseIterable {
  case amex
  case visa
  case masterCard
  case maestro
  case dinersClub
  case jcb
  case discover
  
  var regex: String {
    switch self {
    case .amex:
      return "^3[47]\\d*$"
    case .visa:
      return "^4\\d*$"
    case .masterCard:
      return "^(5[1-5]|222[1-9]|22[3-9]|2[3-6]|27[0-1]|2720)\\d*$"
    case .dinersClub:
      return "^3(0[0-5]|[689])\\d*$"
    case .jcb:
      return "^(2131|1800|35)\\d*$"
    case .discover:
      return "^(6011|65|64[4-9])\\d*$"
    case .maestro:
      // swiftlint: disable line_length
      return "^(?:5[06789]\\d\\d|(?!6011[0234])(?!60117[4789])(?!60118[6789])(?!60119)(?!64[456789])(?!65)6\\d{3})\\d{8,15}$"
      // swiftlint: enable line_length_violation
    }
  }
  
  var validNumberLength: IndexSet {
    switch self {
    case .visa, .masterCard:
      return IndexSet([16])
    case .amex:
      return IndexSet(integer: 15)
    case .maestro:
      return IndexSet(integersIn: 12...19)
    case .dinersClub:
      return IndexSet([14, 16, 19])
    case .discover:
      return IndexSet([16, 19])
    case .jcb:
      return IndexSet(integersIn: 16...19)
    }
  }
  
  var spacing: [Int] {
    switch self {
    case .amex, .dinersClub:
      return [4, 10]
    default:
      return [4, 8, 12]
    }
  }
  
  var cvvLength: Int {
    switch self {
    case .amex:
      return 4
    default:
      return 3
    }
  }
  
  var cardImageName: String {
    "icon-\(self.rawValue.lowercased())"
  }
}
