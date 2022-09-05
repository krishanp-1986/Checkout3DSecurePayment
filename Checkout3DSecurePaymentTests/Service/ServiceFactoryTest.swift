//
//  ServiceFactoryTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class ServiceFactoryTests: QuickSpec {
  struct MockUseCase: Service {
    var dataProvider: DataProvider! = MockNetworkAgent()
    let isCreated: Bool = true
  }
  
  override func spec() {
    describe("service factory") {
      context("for valid service type") {
        it("should return valid usecase") {
          let recipesUseCase = ServiceFactory.useCaseFor(CheckoutCardPaymentUseCase.self)
          expect(recipesUseCase).toNot(beNil())
          
          let mockUseCase = ServiceFactory.useCaseFor(MockUseCase.self)
          expect(mockUseCase).toNot(beNil())
          expect(mockUseCase.isCreated).to(beTrue())
        }
      }
    }
  }
}
