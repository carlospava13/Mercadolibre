//
//  EndPoint.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public protocol EndPointBuilderAble {
    var stringURL: String { get set }
}

public final class EndPointBuilder: EndPointBuilderAble {
    public var stringURL = String()

    init() {
        stringURL = EndPoint.baseUrl
    }

    public func add(_ point: EndPoint.Points) -> Self {
        stringURL.append(point.rawValue)
        return self
    }

    public func build() -> Self {
        return self
    }
}
