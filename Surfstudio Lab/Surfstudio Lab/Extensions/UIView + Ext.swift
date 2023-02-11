//
//  UIView + Ext.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

extension UIView {
    func pinToEdges(of superView: UIView) {
        NSLayoutConstraint.activate(
            widthAnchor.constraint(equalTo: superView.widthAnchor),
            heightAnchor.constraint(equalTo: superView.heightAnchor),
            centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        )
    }
}
