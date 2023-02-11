//
//  Colors.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

extension UIColor {
    static let primaryBackgroundColor: UIColor = .white

    static let normalButtonLabelColor: UIColor = .white
    static let normalButtonBackgroundColor: UIColor = .init(rgb: 0x313131)

    static let footnoteLabelTextColor: UIColor = .init(rgb: 0x96959B)
    static let titleLabelTextColor: UIColor = .init(rgb: 0x313131)

    static let deselectedCellBackgroundColor: UIColor = .init(rgb: 0xF3F3F5)
    static let selectedCellBackgroundColor: UIColor = .init(rgb: 0x313131)

    static let deselectedCellTextColor: UIColor = .init(rgb: 0x313131)
    static let selectedCellTextColor: UIColor = .white

    convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
}
