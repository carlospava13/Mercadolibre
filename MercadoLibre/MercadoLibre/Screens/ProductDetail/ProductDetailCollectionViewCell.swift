//
//  ProductDetailCollectionViewCell.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
import SDWebImage

final class ProductDetailCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var url: String = String() {
        willSet{
            imageView.sd_setImage(with: URL(string: newValue), completed: nil)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageViewConstraints() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
