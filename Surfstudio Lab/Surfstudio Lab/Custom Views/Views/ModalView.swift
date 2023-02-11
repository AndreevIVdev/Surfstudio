//
//  ModalView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

final class ModalView: UIView {

    // MARK: Private Properties

    private let contentView: UIView
    private let contentTopPadding: CGFloat

    private var contentViewHeightConstraint: NSLayoutConstraint!
    private var previousTranslation: CGFloat = 0.0

    // MARK: Initializers

    init(
        contentView: UIView,
        contentTopPadding: CGFloat
    ) {
        self.contentView = contentView
        self.contentTopPadding = contentTopPadding

        super.init(frame: .zero)

        layer.masksToBounds = true

        configureSubViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Methods

    private func configureSubViews() {
        configureContentView()
    }

    private func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = Design.contentViewCornerRadius
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        setupSwipe()
    }

    private func setupConstraints() {
        addSubview(contentView)

        contentViewHeightConstraint = contentView.heightAnchor.constraint(equalToConstant: defaultContentViewHeight)

        NSLayoutConstraint.activate(
            contentViewHeightConstraint,
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        )
    }

    private func setupSwipe() {
        let gesture: UIPanGestureRecognizer = .init(target: self, action: #selector(handleSwipe))
        contentView.addGestureRecognizer(gesture)
    }

    @objc
    private func handleSwipe(gesture: UIPanGestureRecognizer) {
        let currentTranslation = gesture.translation(in: contentView)
        let currentContentHeight = contentViewHeightConstraint.constant
        let delta = previousTranslation - currentTranslation.y
        previousTranslation = currentTranslation.y
        var newHeight = currentContentHeight + delta
        newHeight = max(defaultContentViewHeight, newHeight)
        newHeight = min(maximumContentHeight, newHeight)
        setContentHeight(newHeight)
        if gesture.state == .ended {
            previousTranslation = 0.0
        }
    }

    private func setContentHeight(_ newValue: CGFloat) {
        contentViewHeightConstraint.constant = newValue
        layoutIfNeeded()
    }
}

private extension ModalView {

    // MARK: Design Constants

    enum Design {
        static var contentViewCornerRadius: CGFloat = 30
    }

    var defaultContentViewHeight: CGFloat {
        195.0
    }

    var maximumContentHeight: CGFloat {
        frame.height - contentTopPadding
    }
}
