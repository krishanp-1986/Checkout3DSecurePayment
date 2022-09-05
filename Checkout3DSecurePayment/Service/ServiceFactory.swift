//
//  ServiceFactory.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

struct ServiceFactory {
  static func useCaseFor<T>(_ type: T.Type) -> T where T: Service {
    let dataProvider: DataProvider = NetworkAgent()
    return type.init(with: dataProvider)
  }
}
