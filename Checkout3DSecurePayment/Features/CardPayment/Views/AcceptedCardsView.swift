//
//  AcceptedCardsView.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

final class AcceptedCardsView: UIView {
  private let availableCards: [CreditCardType]
  var selectedCardType: CreditCardType? {
    didSet {
      self.rearrangeCardTypeImages()
    }
  }
  
  init(with availableCards: [CreditCardType] = CreditCardType.allCases) {
    self.availableCards = availableCards
    super.init(frame: .zero)
    self.buildUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func buildUI() {
    self.addSubview(headerLabel)
    self.addSubview(cardTypesImageContainer)
    headerLabel.snp.makeConstraints {
      $0.left.right.top.equalToSuperview()
    }
    cardTypesImageContainer.snp.makeConstraints {
      $0.top.equalTo(headerLabel.snp.top).offset(grid(4))
      $0.left.bottom.equalToSuperview()
    }
    rearrangeCardTypeImages()
  }
  
  private func rearrangeCardTypeImages() {
    let cardImages = self.availableCards.map { type in
      createImageView(type.cardImageName, isSelected: type == self.selectedCardType)
    }
    self.cardTypesImageContainer.removeAllSubviews()
    cardImages.forEach {
      self.cardTypesImageContainer.addArrangedSubview($0)
    }
  }
  
  private lazy var headerLabel: UILabel = {
    let label = UILabel()
    DesignSystem.shared.styles.headerLabel(label)
    label.text = L10n.acceptedCards
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private func createImageView(_ imageName: String, isSelected: Bool) -> UIImageView {
    let imageView = UIImageView(image: .init(named: imageName))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.alpha = isSelected ? 1 : 0.5
    return imageView
  }
  
  private lazy var cardTypesImageContainer: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
}
