//
//  GetProductDetailRepositoring.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine

public protocol GetProductDetailRepositoring {
    func getproduct(id: String) -> AnyPublisher<APIProductDetailModel, Error>
}
