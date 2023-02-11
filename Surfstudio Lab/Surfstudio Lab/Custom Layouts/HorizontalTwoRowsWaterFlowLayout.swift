//
//  HorizontalTwoRowsWaterFlowLayout.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 10.02.2023.
//

import UIKit

protocol HorizontalTwoRowsWaterFlowLayoutDelegate: AnyObject {
    func collectionView(
        _ collectionView: UICollectionView,
        widthForCellAtIndexPath indexPath: IndexPath
    ) -> CGFloat
}

final class HorizontalTwoRowsWaterFlowLayout: UICollectionViewFlowLayout {

    // MARK: Public Properties

    weak var delegate: HorizontalTwoRowsWaterFlowLayoutDelegate?

    // MARK: Private Properties

    private var cache: [UICollectionViewLayoutAttributes] = []

    private let numberOfRows = 2
    private let cellPadding: CGFloat

    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat {
        collectionView?.bounds.height ?? 0
    }

    // MARK: Initializers

    init(cellPadding: CGFloat) {
        self.cellPadding = cellPadding
        super.init()
        scrollDirection = .vertical
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overridden Methods

    override var collectionViewContentSize: CGSize {
        .init(width: contentWidth, height: contentHeight)
    }

    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else { return }

        let rowHeight = contentHeight / CGFloat(numberOfRows)
        var yOffset: [CGFloat] = []

        for row in 0..<numberOfRows {
            yOffset.append(CGFloat(row) * (rowHeight + cellPadding))
        }

        var row = 0
        var xOffset: [CGFloat] = .init(repeating: 0, count: numberOfRows)

        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)

            let itemWidth = delegate?.collectionView(collectionView, widthForCellAtIndexPath: indexPath) ?? 0

            let frame: CGRect = .init(
                x: xOffset[row],
                y: yOffset[row],
                width: itemWidth,
                height: rowHeight - cellPadding
            )

            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)

            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] += itemWidth + 2 * cellPadding
            row = row < (numberOfRows - 1) ? (row + 1) : 0
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        cache.filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
