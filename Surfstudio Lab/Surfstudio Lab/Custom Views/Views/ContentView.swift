//
//  ContentView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 09.02.2023.
//

import UIKit

final class ContentView: UIView {

    private let titleLabel: TitleLabel = {
        let label: TitleLabel = .init(text: .internship)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let primaryFootnoteLabel: FootnoteLabel = {
        let label: FootnoteLabel = .init(text: .workOn)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let primaryCarouselCollectionView: CarouselCollectionView = {
        let collectionView: CarouselCollectionView = .init()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let secondaryFootnoteLabel: FootnoteLabel = {
        let label: FootnoteLabel = .init(text: .getSchcolarship)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let twinCarouselCollectionView: TwinCarouselCollectionView = {
        let collectionView: TwinCarouselCollectionView = .init()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let topPadding: CGFloat
    private let sidePadding: CGFloat
    private let insetPadding: CGFloat
    private let singleRowHeignt: CGFloat

    init(topPadding: CGFloat, sidePadding: CGFloat, insetPadding: CGFloat, singleRowHeignt: CGFloat) {
        self.topPadding = topPadding
        self.sidePadding = sidePadding
        self.insetPadding = insetPadding
        self.singleRowHeignt = singleRowHeignt
        super.init(frame: .zero)
        backgroundColor = .primaryBackgroundColor
        configureSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubViews() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate(
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding)
        )

        addSubview(primaryFootnoteLabel)

        NSLayoutConstraint.activate(
            primaryFootnoteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: insetPadding),
            primaryFootnoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            primaryFootnoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding)
        )

        addSubview(primaryCarouselCollectionView)

        // swiftlint:disable: line_length
        NSLayoutConstraint.activate(
            primaryCarouselCollectionView.topAnchor.constraint(equalTo: primaryFootnoteLabel.bottomAnchor, constant: insetPadding),
            primaryCarouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            primaryCarouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            primaryCarouselCollectionView.heightAnchor.constraint(equalToConstant: singleRowHeignt)
        )

        addSubview(secondaryFootnoteLabel)

        NSLayoutConstraint.activate(
            secondaryFootnoteLabel.topAnchor.constraint(equalTo: primaryCarouselCollectionView.bottomAnchor, constant: topPadding),
            secondaryFootnoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            secondaryFootnoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding)
        )

        addSubview(twinCarouselCollectionView)

        NSLayoutConstraint.activate(
            twinCarouselCollectionView.topAnchor.constraint(equalTo: secondaryFootnoteLabel.bottomAnchor, constant: insetPadding),
            twinCarouselCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            twinCarouselCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            twinCarouselCollectionView.heightAnchor.constraint(equalToConstant: 2 * singleRowHeignt + insetPadding)
        )
        // swiftlint:enable: line_length
    }
}
