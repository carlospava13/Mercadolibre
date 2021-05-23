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

    private lazy var categoryDataSource: CategoryDataSource = {
        CategoryDataSource(cellIdentifier: CategotyCell.self)
    }()

    private var ownerPresenter: HomePresentering! {
        presenter as? HomePresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton()
        setupViews()
        setupTableView()
    }
    
    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
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

    private func setupTableView() {
        tableView.dataSource = categoryDataSource
        tableView.delegate = categoryDataSource
        categoryDataSource.delegate = ownerPresenter
        tableView.layer.cornerRadius = 10
    }
    
    @objc func search() {
        ownerPresenter.showSearch()
    }
}

extension HomeViewController: HomeView {
    func setTitle(_ text: String) {
        title = text
    }

    func setupCategory(data: [CategoryModel]) {
        categoryDataSource.set(data: data)
        tableView.reloadData()
    }
}
