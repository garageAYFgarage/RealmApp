//
//  UIButton+Extension.swift
//  RealmApp
//
//  Created by iFARA💻 on 13.10.2022.
//

import Foundation
import UIKit

extension UIButton {
    static func createDefaultButton(title: String? = nil,
                                    backgroundColor: UIColor = .clear,
                                    cornerRadius: CGFloat = 20) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius

        return button
    }
}
