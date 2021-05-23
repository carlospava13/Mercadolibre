//
//  BaseViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

class BaseViewController: UIViewController, BaseView {
    var presenter: BasePresentering!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind(view: self)
        presenter?.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.backgroundColor = .yellowML
        view.backgroundColor = .white
        view.addGradientView(color: .yellowML)
    }

    deinit {
        presenter?.unBind()
    }
}
