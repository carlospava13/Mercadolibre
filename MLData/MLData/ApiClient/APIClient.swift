//
//  ApiClient.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation
import Combine
import os
public final class APIClient: APIClienting {
    private let session: APIProvider
    public init(session: APIProvider = URLSession.shared) {
        self.session = session
    }
    public func execute<T>(_ endPoint: EndPointBuilderAble) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        print(endPoint.stringURL)
        guard let url = URL(string:endPoint.stringURL) else {
            os_log("url is bad builder \(endPoint.stringURL)")
            return Result.Publisher(HTTPStatusCode.notFound).eraseToAnyPublisher()
        }
        
        return session.apiResponse(for: URLRequest(url: url))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse else {
                    os_log("bad request")
                    throw HTTPStatusCode.badRequest
                }
                
                if let status = response.status, status != .ok {
                    os_log("there is an error with status code \(status.rawValue)")
                    throw status
                }
    
                return $0.data
            }
            .receive(on: RunLoop.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
