//
//  CategoryViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class CategoryViewController: BaseViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.indicatorStyle = .white
        tableView.register(cell: ProductCell.self)
        tableView.separatorStyle = .none
        return tableView
    }()

    private var dataSource: ProductDataSource!

    private var ownerPresenter: CategoryPresentering {
        presenter as! CategoryPresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton()
        setTableViewConstraints()
        setupTableView()
    }
    
    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search(sender:)))
    }

    private func setTableViewConstraints() {
        view.addSubview(tableView)
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guides.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
    }

    private func setupTableView() {
        dataSource = ProductDataSource(cellIdentifier: ProductCell.self)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.layer.cornerRadius = 10
    }

    @objc func search(sender: UIBarButtonItem) {
        ownerPresenter.showSearch()
    }
}

extension CategoryViewController: CategoryView {
    func setTilte(_ text: String) {
        title = text
    }

    func setupProduct(data: [ProductModel]) {
        dataSource.set(data: data)
        tableView.reloadData()
    }
}
