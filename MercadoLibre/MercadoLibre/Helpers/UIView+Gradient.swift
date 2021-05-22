//
//  UIView+Gradient.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

extension UIView {
    func addGradientView(color: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = CGSize(width: frame.width, height: frame.height)
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        layer.addSublayer(gradientLayer)
    }
}
