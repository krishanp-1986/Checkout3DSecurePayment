//
//  CheckoutCardPaymentUseCaseTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CheckoutCardPaymentUseCaseTest: QuickSpec {
  typealias SuccessCallBack = (PaymentResponse) -> Void
  typealias FailureCallBack = (ServiceError) -> Void
  
  override func spec() {
    describe("flickr search UseCase") {
      var mockAgent: MockNetworkAgent!
      var sut: CheckoutCardPaymentUseCase!
      
      var callBack: ((Result<PaymentResponse, ServiceError>) -> Void)!
      var success: SuccessCallBack?
      var failure: FailureCallBack?
      beforeEach {
        mockAgent = MockNetworkAgent()
        sut = CheckoutCardPaymentUseCase(with: mockAgent)
        success = nil
        failure = nil
        
        callBack = { result in
          switch result {
          case .success(let searchResultDTO):
            success?(searchResultDTO)
          case .failure(let error):
            failure?(error)
          }
        }
      }
      context("for successful request") {
        it("should return valid 3ds payment url") {
          mockAgent.mockFileName = "paymentsuccess"
          var fullFill: (() -> Void)?
          
          success = { paymentResponse in
            expect(paymentResponse).toNot(beNil())
            expect(paymentResponse.url).toNot(beEmpty())
            fullFill?()
          }
          
          failure = { _ in
            fail("Expected call to pay to succeed with 3ds url, but it failed with error")
            fullFill?()
          }
          
          waitUntil { done in
            sut.pay(with: PaymentRequestBody.convertDict([:]), whenDone: callBack)
            fullFill = done
          }
        }
      }
      
      context("for failed request") {
        it("should return ServiceError") {
          mockAgent.mockFileName = "invalidresponse"
          var fullFill: (() -> Void)?
          
          success = { recipes in
            fail("Expected call to pay to fail with error, but it succeeded")
            fullFill?()
          }
          
          failure = { error in
            expect(error).notTo(beNil())
            fullFill?()
          }
          
          waitUntil { done in
            sut.pay(with: PaymentRequestBody.convertDict([:]), whenDone: callBack)
            fullFill = done
          }
        }
      }
    }
  }
}
