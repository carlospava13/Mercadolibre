//
//  URLSessionMock.swift
//  MLDataTests
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
import Foundation

enum JsonFile: String {
    case category
    case productByCategory
    case products
    case productdetail
    case productDescription
}

@testable import MLData
class URLSessionMock: APIProvider {
    var jsonFile: JsonFile?

    enum Response {
        case failure(Int)
        case success
    }

    var response: Response

    init() {
        response = .success
    }

    private func decodeJson() throws -> Data {
        let bundle = Bundle(for: type(of: self))

        guard let file = jsonFile?.rawValue else {
            preconditionFailure("is required json file")
        }

        let resource = bundle.path(forResource: file, ofType: "json")
        guard let path = resource else {
            preconditionFailure("is required json file")
        }
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }

    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        Future<APIResponse, URLError> { emitter in
            switch self.response {
            case .failure(let code):

                emitter(.failure(URLError(URLError.Code(rawValue: code))))

            case .success:
                let response = HTTPURLResponse(
                    url: request.url!,
                    statusCode: 200,
                    httpVersion: "HTTP/1.1",
                    headerFields: nil)!
                do {
                    let data = try self.decodeJson()
                    emitter(.success((data: data, response: response)))
                } catch {
                    print("Error \(error)")
                    emitter(.failure(URLError(URLError.Code(rawValue: 10))))
                }
            }
        }.eraseToAnyPublisher()
    }
}
