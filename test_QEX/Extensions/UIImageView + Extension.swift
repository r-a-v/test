//
//  UIImageView + Extension.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 07.09.2021.
//

import UIKit

extension UIImageView {
    convenience init(systemImage: String) {
        self.init()
        self.image = UIImage(systemName: systemImage)
        self.contentMode = .scaleAspectFit
    }
}
