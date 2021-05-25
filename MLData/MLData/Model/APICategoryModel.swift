//
//  APICategoryModel.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public struct APICategoryModel: Codable {
    public let id: String
    public let name: String
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
