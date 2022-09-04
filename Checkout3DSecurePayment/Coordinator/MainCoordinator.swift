//
//  MainCoordinator.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation
import UIKit

struct MainCoordinator: Coordinator {
  private let window: UIWindow?
  
  init(with window: UIWindow?) {
    self.window = window
  }
  
  func start() {
    self.window?.rootViewController = CardPayment.build()
    self.window?.makeKeyAndVisible()
  }
}
