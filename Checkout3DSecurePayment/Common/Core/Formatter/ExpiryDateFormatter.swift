//
//  ExpiryDateFormatter.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

struct ExpiryDateFormatter: Formattable {
  func formatString(_ string: String, reverse: Bool = false) -> String {
    var formattedString = String()
    let normalizedString = string.replacingOccurrences(of: "/", with: "")
    guard !reverse else {
      return normalizedString
    }
    var idx = 0
    var character: Character
    while idx < normalizedString.count {
      let index = normalizedString.index(normalizedString.startIndex, offsetBy: idx)
      character = normalizedString[index]
      
      if idx == 4 {
        formattedString.append("/")
      }
      formattedString.append(character)
      
      idx += 1
    }
    
    
    return formattedString
  }
}
