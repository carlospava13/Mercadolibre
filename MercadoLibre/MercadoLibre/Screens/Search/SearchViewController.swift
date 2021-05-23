//
//  SearchViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class SearchViewController: BaseViewController {
    lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.placeholder = TextML.Search.placeholder
        return searchBar
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.indicatorStyle = .white
        tableView.register(cell: ProductCell.self)
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .none
        tableView.alpha = 0
        return tableView
    }()

    private var dataSource: ProductDataSource!
    
    private var ownerPresenter: SearchPresentering {
        presenter as! SearchPresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setLeftBarButtonItem()
        setupSearchBar()
        setContentViewConstraints()
        setTableViewConstraints()
        setupTableView()
    }

    private func setLeftBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(close))
    }

    private func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }

    private func setContentViewConstraints() {
        view.addSubview(contentView)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: guide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }

    private func setTableViewConstraints() {
        contentView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    private func setupTableView() {
        dataSource = ProductDataSource(cellIdentifier: ProductCell.self)
        dataSource.delegate = ownerPresenter
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.layer.cornerRadius = 10
    }

    @objc func close() {
        ownerPresenter.closeSearch()
    }
}

extension SearchViewController: SearchView {
    func setTitle(_ text: String) {
        title = text
    }

    func showTableViewWithAnimation() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.tableView.alpha = 1
        }
    }

    func setupProduct(data: [ProductModel]) {
        dataSource.set(data: data)
        tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        ownerPresenter.search(product: text)
        searchBar.resignFirstResponder()
    }
}
