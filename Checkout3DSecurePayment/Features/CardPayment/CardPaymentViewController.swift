//
//  ViewController.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

class CardPaymentViewController: BaseViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    buildUI()
  }
  
  private func buildUI() {
    self.view.addSubview(containerStackView)
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
    containerStackView.snp.makeConstraints {
      $0.left.right.top.equalTo(safeAreaLayoutGuide).inset(grid(2))
    }
    
    submitButton.snp.makeConstraints {
      $0.left.right.bottom.equalToSuperview()
      $0.height.equalTo(grid(7))
    }
  }
  
  private lazy var containerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      acceptedCardsView,
      creditCardNumberInput,
      expiryCVVView,
      submitButton
    ]
    )
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var creditCardNumberInput: InputViewValidatable = {
    let inputView = InputView(with: CreditCardInputViewModel())
    inputView.translatesAutoresizingMaskIntoConstraints = false
    return inputView
  }()
  
  private lazy var acceptedCardsView: AcceptedCardsView = {
    let view = AcceptedCardsView(with: CreditCardType.allCases)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var expiryCVVView: ExpiryCVVView = {
    let view = ExpiryCVVView(with: ExpiryCVVViewModel())
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var submitButton: Button = {
    let button = Button()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(L10n.pay, for: .normal)
    return button
  }()
}
