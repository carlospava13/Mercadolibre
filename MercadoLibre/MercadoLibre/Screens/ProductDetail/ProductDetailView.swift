//
//  ProductDetailView.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
import MLData
final class ProductDetailViewer: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var productTitleLabel: ItemTitleLabel = {
        let label = ItemTitleLabel()
        label.sizeFont = 20
        return label
    }()
    
    private var layout = UICollectionViewFlowLayout()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var priceLabel: ItemDescriptionLabel = {
       let label = ItemDescriptionLabel()
        label.sizeFont = 25
        return label
    }()
    
    private lazy var descriptionTitleLabel: ItemDescriptionLabel = {
       let label = ItemDescriptionLabel()
        label.sizeFont = 25
        return label
    }()
    
    private lazy var descriptionLabel = ItemDescriptionLabel()
    
    private var dataSource: ProductDetailCollectionDataSource!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollViewConstraints()
        setContainerViewConstraints()
        setupViews()
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = CGSize(width: collectionView.bounds.width,
                                 height: collectionView.bounds.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
    }

    private func setScrollViewConstraints() {
        addSubview(scrollView)
        let guides = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: guides.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: guides.centerXAnchor)
        ])
    }
    
    private func setContainerViewConstraints() {
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupViews() {
        setProductTitleLabelConstraints()
        setCollectionViewConstraints()
        setPriceLabelConstraints()
        setdescriptionTitleLabelConstraints()
        setdescriptionLabelConstraints()
    }

    private func setProductTitleLabelConstraints() {
        containerView.addSubview(productTitleLabel)
        NSLayoutConstraint.activate([
            productTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setCollectionViewConstraints() {
        containerView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setPriceLabelConstraints() {
        containerView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setdescriptionTitleLabelConstraints() {
        containerView.addSubview(descriptionTitleLabel)
        NSLayoutConstraint.activate([
            descriptionTitleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setdescriptionLabelConstraints() {
        containerView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    
    private func setupCollectionView() {
        collectionView.register(ProductDetailCollectionViewCell.self, forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
        dataSource = ProductDetailCollectionDataSource()
        collectionView.dataSource = dataSource
    }
    
    func set(detail: APIProductDetailModel) {
        productTitleLabel.text = detail.title
        priceLabel.text = detail.price.setCurrentMoneyFormatter()
        dataSource.set(data: detail.pictures)
        collectionView.reloadData()
    }
    
    func set(titleDescription: String) {
        descriptionTitleLabel.text = titleDescription
    }
    
    func set(description: String) {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = description
        descriptionLabel.sizeToFit()
        
    }
}
