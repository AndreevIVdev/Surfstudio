//
//  CarouselCollectionView.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 09.02.2023.
//

import UIKit

final class CarouselCollectionView: UICollectionView {

    // MARK: Private Properties

    private var datasource: [(text: String, isSelected: Bool)] = [
        "iOS", "Android", "Design", "QA", "Flutter", "PM", "Frontend", "Backend", "Devops", "HR"
    ]
        .map { ($0, false) }
        .shuffled()

    private var isInfiniteScrollNeeded: Bool {
        guard let firstCellTextWidth = datasource.first?.text.widthUsingFont(.body) else {
            return false
        }
        return contentSize.width > bounds.width + firstCellTextWidth + Design.horizontalPadding
    }

    // MARK: Initializers

    init() {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
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

extension CarouselCollectionView: UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
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

extension CarouselCollectionView: UIScrollViewDelegate {

    // MARK: UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isInfiniteScrollNeeded else { return }

        if contentOffset.x <= -Design.minimumInteritemSpacing / 2 {
            datasource.insert(datasource.removeLast(), at: 0)
            reloadData()
            scrollAfterFirstCellWithOffset(contentOffset.x)
        } else if contentOffset.x + bounds.width >= contentSize.width + Design.minimumInteritemSpacing / 2 {
            datasource.append(datasource.removeFirst())
            reloadData()
            scrollBeforeLastCellWithOffset(contentOffset.x)
        }
    }
}

extension CarouselCollectionView: UICollectionViewDelegate {

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        datasource[indexPath.row].isSelected.toggle()
        reloadItems(at: [indexPath])
    }
}

extension CarouselCollectionView: UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = datasource[indexPath.item].text.widthUsingFont(.body)
        return .init(width: width + Design.horizontalPadding, height: collectionView.frame.height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Design.minimumInteritemSpacing
    }
}

private extension CarouselCollectionView {

    // MARK: InfiniteScroll Methods

    func scrollAfterFirstCellWithOffset(_ offset: CGFloat) {
        let absoluteOffset = Design.horizontalPadding +
        datasource.first!.text.widthUsingFont(.body) +
        offset + Design.minimumInteritemSpacing
        setContentOffset(
            .init(x: absoluteOffset, y: contentOffset.y),
            animated: false
        )
    }

    func scrollBeforeLastCellWithOffset(_ offset: CGFloat) {
        let absoluteOffset = offset
        - Design.horizontalPadding
        - datasource.last!.text.widthUsingFont(.body)
        - Design.minimumInteritemSpacing
        setContentOffset(
            .init(x: absoluteOffset, y: contentOffset.y),
            animated: false
        )
    }
}

private extension CarouselCollectionView {

    // MARK: Design Constants

    enum Design {
        static let minimumInteritemSpacing: CGFloat = 12
        static let horizontalPadding: CGFloat = 48
    }
}
