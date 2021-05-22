//
//  BaseViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.backgroundColor = .yellowML
        view.backgroundColor = .white
        view.addGradientView(color: .yellowML)
    }
}
