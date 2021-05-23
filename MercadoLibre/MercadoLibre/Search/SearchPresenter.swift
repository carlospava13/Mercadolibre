//
//  SearchPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

final class SearchPresenter: BasePresenter {
    struct InputDependencies {
         var coordinator: SearchCoordinatorDelegate?
    }
    
    private var dependencies: InputDependencies

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
}

extension SearchPresenter: SearchPresentering {
    func closeSearch() {
        dependencies.coordinator?.close()
    }
}
