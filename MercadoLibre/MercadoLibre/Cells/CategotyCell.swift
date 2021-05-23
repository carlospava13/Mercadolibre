//
//  CategotyCell.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import SDWebImage
import UIKit

final class CategotyCell: BaseTableViewCell<CategoryModel> {
    private lazy var itemTitleLabel = ItemTitleLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setItemTitleLabelConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setItemTitleLabelConstraints() {
        addSubview(itemTitleLabel)
        NSLayoutConstraint.activate([
            itemTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            itemTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            itemTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            itemTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
    
    override func set(data: CategoryModel) {
        itemTitleLabel.text = data.title
    }
}
