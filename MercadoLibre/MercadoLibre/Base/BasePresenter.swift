//
//  BasePresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

class BasePresenter: BasePresentering {
    weak var view: BaseView?
    var subscriptions = Set<AnyCancellable>()

    func bind(view: BaseView) {
        self.view = view
    }

    func viewDidLoad() {}
    
    func unBind() {
        view = nil
    }
}
