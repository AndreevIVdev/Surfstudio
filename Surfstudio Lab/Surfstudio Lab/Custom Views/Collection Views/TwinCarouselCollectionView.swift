//
//  TwinCarouselCollectionView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 10.02.2023.
//

import UIKit

class TwinCarouselCollectionView: UICollectionView {

    // MARK: Private Properties

    private var datasource: [(text: String, isSelected: Bool)] = [
        "Manual Tester",
        "Python",
        "Android",
        "Design",
        "QA",
        "Flutter",
        "PM",
        "Frontend",
        "Backend",
        "iOS",
        "Devops",
        "HR",
        "Game designer",
        "FullStack"
    ]
        .map { ($0, false) }
        .shuffled()

    // MARK: Initializers

    init() {
        let layout: HorizontalTwoRowsWaterFlowLayout = .init(cellPadding: Design.minimumInteritemSpacing / 2)
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.delegate = self
        contentInset = .init(top: 0, left: Design.minimumInteritemSpacing, bottom: 0, right: 0)
        backgroundColor = .primaryBackgroundColor
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.description())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) is not implemented")
    }
}

extension TwinCarouselCollectionView: UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datasource.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselCollectionViewCell.description(),
            for: indexPath
        ) as? CarouselCollectionViewCell else { return .init() }

        cell.configure(text: datasource[indexPath.row].text, isSelected: datasource[indexPath.row].isSelected)

        return cell
    }
}

extension TwinCarouselCollectionView: UICollectionViewDelegate {

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        datasource[indexPath.row].isSelected.toggle()
        reloadItems(at: [indexPath])
    }
}

extension TwinCarouselCollectionView: HorizontalTwoRowsWaterFlowLayoutDelegate {

    // MARK: HorizontalTwoRowsWaterFlowLayoutDelegate

    func collectionView(_ collectionView: UICollectionView, widthForCellAtIndexPath indexPath: IndexPath) -> CGFloat {
        datasource[indexPath.item].text.widthUsingFont(.body) + Design.horizontalPadding
    }
}

private extension TwinCarouselCollectionView {

    // MARK: Design Constants

    enum Design {
        static let minimumInteritemSpacing: CGFloat = 12.0
        static let horizontalPadding: CGFloat = 48
    }
}
