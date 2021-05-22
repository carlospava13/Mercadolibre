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

public final class EndPointBuilder {
    public var urlEndPoint: EndPointBuilderAble

    public init(urlEndPoint: EndPointBuilderAble = EndPoint()) {
        self.urlEndPoint = urlEndPoint
        self.urlEndPoint.stringURL.append(EndPointValue.baseUrl)
    }

    public func add(_ point: EndPointValue.Points) -> Self {
        urlEndPoint.stringURL.append(point.rawValue)
        return self
    }
    
    public func add(_ value: String) -> Self {
        urlEndPoint.stringURL.append(value)
        return self
    }

    public func build() -> EndPointBuilderAble {
        return urlEndPoint
    }
}

public class EndPoint: EndPointBuilderAble {
    public var stringURL: String = ""
    public init() {}
}
