//
//  ItemCell.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
import SDWebImage

final class ProductCell: BaseTableViewCell<ProductModel> {
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var itemTitleLabel = ItemTitleLabel()

    private lazy var itemPriceLabel =  ItemDescriptionLabel()
    
    private lazy var itemConditionLabel =  ItemAdviceLabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setItemTitleConstraints()
        setItemPriceTitleConstraints()
        setItemConditionLabelConstraints()
        setItemImageViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setItemTitleConstraints() {
        addSubview(itemTitleLabel)
        NSLayoutConstraint.activate([
            itemTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            itemTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setItemPriceTitleConstraints() {
        addSubview(itemPriceLabel)
        NSLayoutConstraint.activate([
            itemPriceLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 8),
            itemPriceLabel.leadingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor),
            itemPriceLabel.trailingAnchor.constraint(equalTo: itemTitleLabel.trailingAnchor)
        ])
    }
    
    private func setItemConditionLabelConstraints() {
        addSubview(itemConditionLabel)
        NSLayoutConstraint.activate([
            itemConditionLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: 8),
            itemConditionLabel.leadingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor),
            itemConditionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func setItemImageViewConstraints() {
        addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemImageView.trailingAnchor.constraint(equalTo: itemTitleLabel.leadingAnchor, constant: -16),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    

    override func set(data: ProductModel) {
        itemTitleLabel.text = data.title
        itemPriceLabel.text = data.price.setCurrentMoneyFormatter()
        itemConditionLabel.text = data.condition
        itemImageView.sd_setImage(with: URL(string: data.thumbnail), completed: nil)
    }
}
