//
//  String + Ext.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 09.02.2023.
//

import UIKit

extension String {
    func widthUsingFont(_ font: UIFont) -> CGFloat {
        self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}
