//
//  BaseViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

class BaseViewController: UIViewController, BaseView {
 
    var presenter: BasePresentering?
    lazy var spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.bind(view: self)
        presenter?.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .yellowML
        navigationController?.removeLines()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addGradientView(color: .yellowML)
    }

    deinit {
        presenter?.unBind()
    }
    
    func showLoading() {
        spinner.startAnimating()
    }
    
    func hideLoading() {
        spinner.stopAnimating()
    }
}
