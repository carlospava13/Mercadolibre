//
//  GetCategoryRepositoring.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public protocol GetCategoryRepositoring {
    func getCategories() -> AnyPublisher<[CategoryDto], Error>
}
