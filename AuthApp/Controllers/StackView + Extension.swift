//
//  StackView + Extension.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 27.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import Foundation

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
    
}
