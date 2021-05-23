//
//  GetProductDetailDescriptionRepositoring.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine

public protocol GetProductDetailDescriptionRepositoring {
    func getproduct(id: String) -> AnyPublisher<[APIProductDetailDescriptionModel], Error>
}
