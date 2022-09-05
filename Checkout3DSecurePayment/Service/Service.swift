//
//  Service.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

protocol Service {
  var dataProvider: DataProvider! { get set }
  init()
}

extension Service {
  init(with dataProvider: DataProvider) {
    self.init()
    self.dataProvider = dataProvider
  }
}
