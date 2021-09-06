//
//  UILabel + Extension.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, fontSize: CGFloat) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
    
}
