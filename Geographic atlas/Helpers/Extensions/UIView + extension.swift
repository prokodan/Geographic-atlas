//
//  UIView + extension.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(withColor color: UIColor, andHeight height: CGFloat ) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func roundCorners(with radius: CGFloat, and corners: CACornerMask) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
}
