//
//  Validator.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

protocol Validator {
  func isValid(_ input: String?) -> (isValid: Bool, errorMessage: String?)
}
