//
//  BottomView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

final class BottomView: UIView {

    // MARK: Subviews

    lazy
    private var actionButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .subtitle
        button.setTitleColor(.normalButtonLabelColor, for: .normal)
        button.setTitle(.sendRequest, for: .normal)
        button.backgroundColor = .normalButtonBackgroundColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.addAction(.init(handler: { [unowned self] _ in onActionButtonTap?() }), for: .touchUpInside)
        return button
    }()

    private let descriptionLabel: FootnoteLabel = {
        let label: FootnoteLabel = .init(text: .doYouWantToJoinUs)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Private Properties

    private var onActionButtonTap: (() -> Void)?

    // MARK: Initializers

    init(onActionButtonTap: (() -> Void)? = nil) {
        self.onActionButtonTap = onActionButtonTap
        super.init(frame: .zero)
        backgroundColor = .primaryBackgroundColor
        configureSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) is not implemented")
    }

    // MARK: Layout

    private func configureSubViews() {
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate(
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        )

        addSubview(actionButton)
        NSLayoutConstraint.activate(
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            actionButton.heightAnchor.constraint(equalTo: heightAnchor),
            actionButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: Design.innerPadding) // swiftlint:disable:this line_length
        )
    }
}

private extension BottomView {

    // MARK: Design Constants

    enum Design {
        static let innerPadding: CGFloat = 24
    }
}
