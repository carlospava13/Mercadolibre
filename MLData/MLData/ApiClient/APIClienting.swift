//
//  ApiClientType.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import Foundation
public protocol APIClienting {
    func execute<T: Codable>(_ endPoint: EndPointBuilderAble) -> AnyPublisher<T, Error>
}
