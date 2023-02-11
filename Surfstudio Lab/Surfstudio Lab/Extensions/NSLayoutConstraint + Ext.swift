//
//  NSLayoutConstraint + Ext.swift
//  Surfstudio Lab
//
//  Created by Илья Андреев on 08.02.2023.
//

import UIKit

extension NSLayoutConstraint {
    class func activate(_ constraints: NSLayoutConstraint...) {
        for constraint in constraints {
            activate([constraint])
        }
    }
}
