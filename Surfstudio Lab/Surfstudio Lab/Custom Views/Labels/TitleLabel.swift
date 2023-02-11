//
//  TitleLabel.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 09.02.2023.
//

import UIKit

final class TitleLabel: UILabel {

    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        font = .title
        textColor = .titleLabelTextColor
        numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) is not implemented")
    }
}
