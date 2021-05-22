//
//  HTTPStatusCode.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

enum HTTPStatusCode: Int, Error {
    case ok = 200
    case found = 302
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
}

extension HTTPURLResponse {
    var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }
}
