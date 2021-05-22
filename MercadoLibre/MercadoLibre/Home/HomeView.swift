//
//  HomeView.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class HomeView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cell: ItemCell.self)
        tableView.register(cell: CategotyCell.self)
        return tableView
    }()

    private lazy var itemDataSource: ItemDataSource = {
        ItemDataSource(cellIdentifier: ItemCell.self)
    }()
    
    private lazy var categoryDataSource: CategoryDataSource = {
        CategoryDataSource(cellIdentifier: CategotyCell.self)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        addGradientView(color: .yellowML)
    }
    
    private func setDataSource(_ dataSource: UITableViewDataSource & UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }

    func setItem(data: [ItemModel]) {
        setDataSource(itemDataSource)
        itemDataSource.set(data: data)
        tableView.reloadData()
    }
    
    func setCategory(data: [CategoryModel]) {
        setDataSource(categoryDataSource)
        categoryDataSource.set(data: data)
        tableView.reloadData()
    }
}
