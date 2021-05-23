//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class HomeViewController: BaseViewController {

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//    private lazy var titleLabel: ItemTitleLabel = {
//        let label = ItemTitleLabel()
//        label.textColor = .black
//        return label
//    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.indicatorStyle = .white
        tableView.register(cell: ProductCell.self)
        tableView.register(cell: CategotyCell.self)
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .none
        return tableView
    }()

    private lazy var itemDataSource: ProductDataSource = {
        ProductDataSource(cellIdentifier: ProductCell.self)
    }()

    private lazy var categoryDataSource: CategoryDataSource = {
        CategoryDataSource(cellIdentifier: CategotyCell.self)
    }()

    private var ownerPresenter: HomePresentering {
        presenter as! HomePresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        //searchBar.delegate = self
        setupViews()
        tableView.layer.cornerRadius = 10
        
        setupCategory()
    }

    private func setupViews() {
        setContentViewConstraints()
        setTableViewConstraints()
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

    private func setDataSource(_ dataSource: UITableViewDataSource & UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        ownerPresenter.search(text: text)
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        ownerPresenter.getCategories()
    }
}

extension HomeViewController: HomeView {
    func setupCategory() {
        title = TextML.Category.title
        setDataSource(categoryDataSource)
        categoryDataSource.delegate = ownerPresenter
        categoryDataSource.set(data: [])
        tableView.reloadData()
    }

    func setupProducts() {
        title = TextML.Product.title
        setDataSource(itemDataSource)
        itemDataSource.set(data: [])
        tableView.reloadData()
    }

    func setupProduct(data: [ProductModel]) {
        itemDataSource.set(data: data)
        tableView.reloadData()
    }

    func setupCategory(data: [CategoryModel]) {
        categoryDataSource.set(data: data)
        tableView.reloadData()
    }
}
