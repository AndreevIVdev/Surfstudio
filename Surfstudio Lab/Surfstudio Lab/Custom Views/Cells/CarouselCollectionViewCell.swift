//
//  CarouselCollectionViewCell.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 09.02.2023.
//

import UIKit

final class CarouselCollectionViewCell: UICollectionViewCell {

    private let textLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .body
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        configureSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String, isSelected: Bool) {
        textLabel.text = text
        textLabel.textColor = isSelected ? .selectedCellTextColor : .deselectedCellTextColor
        contentView.backgroundColor = isSelected ? .selectedCellBackgroundColor : .deselectedCellBackgroundColor
    }

    private func configureSubViews() {
        contentView.addSubview(textLabel)
        NSLayoutConstraint.activate(
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        )
    }
}
