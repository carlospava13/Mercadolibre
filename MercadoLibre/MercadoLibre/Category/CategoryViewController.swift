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

    private lazy var dataSource: ProductDataSource = {
        ProductDataSource(cellIdentifier: ProductCell.self)
    }()
    
    private var ownerPresenter: CategoryPresentering {
        presenter as! CategoryPresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =    UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search(sender:)))
        setTableViewConstraints()
        setupTableView()
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

extension CategoryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }

        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
}
