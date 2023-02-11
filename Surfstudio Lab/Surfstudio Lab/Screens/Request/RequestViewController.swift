//
//  RequestViewController.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

final class RequestViewController: UIViewController {

    var onActionButtonTap: (() -> Void)?

    // MARK: Sunviews

    private let backgroundView: BackgroundView = .init(contentView: {
            let backgroundView: UIImageView = .init(image: .requsetBackgroundImage)
            backgroundView.contentMode = .scaleAspectFill
            return backgroundView
        }()
    )

    lazy private var modalView: ModalView = .init(
        contentView: contentView,
        contentTopPadding: UIApplication.shared.statusBarHeight
    )

    private let contentView: ContentView = .init(
        topPadding: Design.topPadding,
        sidePadding: Design.sidePadding,
        insetPadding: Design.insetPadding,
        singleRowHeignt: Design.singleRowHeignt
    )

    private let underlyingView: UIView = .init()

    lazy
    private var bottomView: BottomView = .init(onActionButtonTap: onActionButtonTap)

    // MARK: Lifecycle

    override func loadView() {
        super.loadView()

        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.pinToEdges(of: view)

        view.addSubview(modalView)
        view.addSubview(underlyingView)
        view.addSubview(bottomView)

        underlyingView.translatesAutoresizingMaskIntoConstraints = false

        modalView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            modalView.topAnchor.constraint(equalTo: view.topAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        )

        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Design.bottomPadding),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Design.sidePadding),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Design.sidePadding),
            bottomView.heightAnchor.constraint(equalToConstant: Design.actionButtonHeight)
        )

        NSLayoutConstraint.activate(
            underlyingView.topAnchor.constraint(equalTo: modalView.bottomAnchor),
            underlyingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            underlyingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            underlyingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryBackgroundColor

        configureSubViews()
    }

    private func configureSubViews() {
        underlyingView.backgroundColor = .primaryBackgroundColor
    }
}

private extension RequestViewController {

    // MARK: Design Constants

    enum Design {
        static let bottomPadding: CGFloat = 58
        static let actionButtonHeight: CGFloat = 60
        static let sidePadding: CGFloat = 20
        static let topPadding: CGFloat = 24
        static let insetPadding: CGFloat = 12
        static let singleRowHeignt: CGFloat = 44
    }
}
