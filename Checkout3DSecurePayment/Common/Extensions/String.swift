//
//  String.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

public extension String {
  var creditCardExpiryDate: Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMM"
    return dateFormatter.date(from: self)
  }
}
