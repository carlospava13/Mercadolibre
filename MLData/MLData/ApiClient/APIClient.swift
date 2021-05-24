//
//  ApiClient.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation
import Combine

public final class APIClient: APIClienting {
    private let session: APIProvider
    public init(session: APIProvider = URLSession.shared) {
        self.session = session
    }
    public func execute<T>(_ endPoint: EndPointBuilderAble) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        
        guard let url = URL(string:endPoint.stringURL) else {
            return Result.Publisher(HTTPStatusCode.notFound).eraseToAnyPublisher()
        }
        
        return session.apiResponse(for: URLRequest(url: url))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse else {
                    throw HTTPStatusCode.badRequest
                }
                
                if let status = response.status, status != .ok {
                    throw status
                }
    
                return $0.data
            }
            .receive(on: RunLoop.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
