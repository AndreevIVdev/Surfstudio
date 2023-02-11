//
//  BackgroundView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

final class BackgroundView: UIView {

    private let contentView: UIView

    init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame: .zero)
        configureSubViews()
    }

    private func configureSubViews() {
        contentView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(contentView)

        let bottomConstraint = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .defaultLow

        NSLayoutConstraint.activate(
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomConstraint
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
