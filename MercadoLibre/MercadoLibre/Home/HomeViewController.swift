//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import MLData
import UIKit

final class HomeViewController: BaseViewController {
    private lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.delegate = self
        searchBar.placeholder = TextML.Search.placeholder
        searchBar.showsCancelButton = true
        return searchBar
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: ItemTitleLabel = {
        let label = ItemTitleLabel()
        label.textColor = .black
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.indicatorStyle = .white
        tableView.register(cell: ItemCell.self)
        tableView.register(cell: CategotyCell.self)
        tableView.layer.masksToBounds = true
        return tableView
    }()

    private lazy var itemDataSource: ItemDataSource = {
        ItemDataSource(cellIdentifier: ItemCell.self)
    }()

    private lazy var categoryDataSource: CategoryDataSource = {
        CategoryDataSource(cellIdentifier: CategotyCell.self)
    }()

    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupViews()
        getCategories()
        tableView.layer.cornerRadius = 10
    }

    private func setupViews() {
        setContentViewConstraints()
        setTitleLabelConstraints()
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

    private func setTitleLabelConstraints() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    private func setTableViewConstraints() {
        contentView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    private func setDataSource(_ dataSource: UITableViewDataSource & UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }

    private func getCategories() {
        let repository = GetCategoriesRepository()
        repository.getCategories().sink { completion in
            print(completion)
        } receiveValue: { [weak self] categories in
            self?.parse(categories: categories)
        }.store(in: &subscriptions)
    }

    private func parse(categories: [CategoryDto]) {
        var data: [CategoryModel] = []
        categories.forEach { categoryDto in
            data.append(CategoryModel(title: categoryDto.name))
        }
        setupCategory(data: data)
    }

    private func getItems(_ item: String) {
        let respository = GetItemRepository()
        respository.getItems(item: item).sink { completion in
            print(completion)
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
        }.store(in: &subscriptions)
    }

    private func parse(items: [APIItemModel]) {
        var data: [ItemModel] = []
        items.forEach { apiModel in
            data.append(ItemModel(
                title: apiModel.title,
                price: apiModel.price,
                condition: apiModel.condition,
                thumbnail: apiModel.thumbnail))
        }
        setupProduct(data: data)
    }
    
    private func setupProduct(data: [ItemModel]) {
        titleLabel.text = TextML.Product.title
        setDataSource(itemDataSource)
        itemDataSource.set(data: data)
        tableView.reloadData()
    }

    private func setupCategory(data: [CategoryModel]) {
        titleLabel.text = TextML.Category.title
        setDataSource(categoryDataSource)
        categoryDataSource.set(data: data)
        tableView.reloadData()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getItems(searchBar.text!)
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        getCategories()
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
}
