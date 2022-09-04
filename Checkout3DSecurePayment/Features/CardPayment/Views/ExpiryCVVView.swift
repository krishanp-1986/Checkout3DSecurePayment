//
//  ExpiryCVVView.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

final class ExpiryCVVView: UIView, InputViewValidatable {
  var viewModel: InputViewDataProvidable
  
  init(with viewModel: InputViewDataProvidable) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    buildUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func buildUI() {
    self.addSubview(container)
    container.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func isValid() -> Bool {
    expiryDateInputView.isValid() && cvvInputField.isValid()
  }
  
  func getValue() -> [String: String?] {
    self.viewModel.getValue()
  }
  
  
  private lazy var expiryDateInputView: InputViewValidatable = {
    let inputView = InputView(with: ExpiryViewModel())
    inputView.translatesAutoresizingMaskIntoConstraints = false
    return inputView
  }()
  
  private lazy var cvvInputField: InputViewValidatable = {
    let inputView = InputView(with: CVVViewModel())
    inputView.translatesAutoresizingMaskIntoConstraints = false
    return inputView
  }()
  
  lazy var container: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [expiryDateInputView, cvvInputField])
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
}
