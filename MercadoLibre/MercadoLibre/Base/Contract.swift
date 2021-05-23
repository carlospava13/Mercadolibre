//
//  Contract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol BasePresentering {
    func bind(view: BaseView)
    func viewDidLoad()
    func unBind()
}

protocol BaseView {}
