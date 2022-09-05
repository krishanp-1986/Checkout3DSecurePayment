//
//  CreditCardFormatter.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

class CreditCardNumberFormatter: Formattable {
  var grouping: [Int] = [4, 8, 12]
  
  func formatString(_ string: String, reverse: Bool = false) -> String {
    var formattedString = String()
    let normalizedString = string.replacingOccurrences(of: " ", with: "")
    guard !reverse else {
      return normalizedString
    }
    
    var idx = 0
    var character: Character
    while idx < normalizedString.count {
      let index = normalizedString.index(normalizedString.startIndex, offsetBy: idx)
      character = normalizedString[index]
      
      if idx != 0 && self.grouping.contains(idx) {
        formattedString.append(" ")
      }
      
      formattedString.append(character)
      idx += 1
    }
    
    
    return formattedString
  }
}
