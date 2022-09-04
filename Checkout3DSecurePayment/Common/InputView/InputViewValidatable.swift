//
//  InputViewValidatable.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation
import UIKit
import SnapKit

protocol InputViewValidatable: UIView {
  var viewModel: InputViewDataProvidable { get }
  func isValid() -> Bool
  func getValue() -> [String: String?]
}


open class InputView: UIView {
  let viewModel: InputViewDataProvidable
  
  init(with viewModel: InputViewDataProvidable, keyBoardType: UIKeyboardType = .numberPad) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    self.buildUI()
    self.bindUI(keyBoardType)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func buildUI() {
    self.addSubview(containerView)
    containerView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    inputField.snp.makeConstraints {
      $0.height.equalTo(grid(7))
    }
  }
  
  private func bindUI(_ keyboardType: UIKeyboardType) {
    self.inputField.keyboardType = keyboardType
    self.headerLabel.text = L10n.value(for: self.viewModel.key)
    self.inputField.placeholder = self.viewModel.placeHolder
    
    self.inputField.delegate = self
  }
  
  private lazy var containerView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [headerLabel, inputField, errorLabel])
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var headerLabel: UILabel = {
    let label = UILabel()
    DesignSystem.shared.styles.headerLabel(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var inputField: TextInput = {
    let input = TextInput()
    input.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
    input.translatesAutoresizingMaskIntoConstraints = false
    return input
  }()
  
  @objc func textFieldChanged(_ sender: UITextField) {
    self.viewModel.setValue(sender.text)
  }
  
  private lazy var errorLabel: UILabel = {
    let label = UILabel()
    DesignSystem.shared.styles.headerLabel(label)
    label.textColor = DesignSystem.shared.colors.error
    label.font = DesignSystem.shared.fonts.errorFont
    label.isHidden = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
}

extension InputView: InputViewValidatable {
  func isValid() -> Bool {
    self.viewModel.isValid()
  }
  
  func getValue() -> [String: String?] {
    self.viewModel.getValue()
  }
}

extension InputView: UITextFieldDelegate {
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    self.inputField.setToNormalState()
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    if !self.viewModel.isValid() {
      self.inputField.setToErrorState()
    }
  }
}
