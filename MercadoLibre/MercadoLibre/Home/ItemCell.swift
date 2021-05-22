//
//  ItemCell.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
import SDWebImage

final class ItemCell: BaseTableViewCell<ItemModel> {
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var itemPriceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setItemImageViewConstraints()
        setItemTitleConstraints()
        setItemPriceTitleConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setItemImageViewConstraints() {
        contentView.addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setItemTitleConstraints() {
        contentView.addSubview(itemTitleLabel)
        NSLayoutConstraint.activate([
            itemTitleLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor),
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            itemTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setItemPriceTitleConstraints() {
        contentView.addSubview(itemPriceTitleLabel)
        NSLayoutConstraint.activate([
            itemPriceTitleLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor),
            itemPriceTitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            itemPriceTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            itemPriceTitleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override func set(data: ItemModel) {
        itemTitleLabel.text = data.title
        itemPriceTitleLabel.text = String(data.price)
        itemImageView.sd_setImage(with: URL(string: data.thumbnail), completed: nil)
    }
}
