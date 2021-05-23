//
//  UIView+Gradient.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

extension UIView {
    func addGradientView(color: UIColor) {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = CGSize(width: bounds.width, height: bounds.height)
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
