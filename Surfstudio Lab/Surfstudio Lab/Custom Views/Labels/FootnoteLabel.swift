//
//  BodyLabel.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

final class FootnoteLabel: UILabel {

    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        font = .footnote
        textColor = .footnoteLabelTextColor
        numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) is not implemented")
    }
}
