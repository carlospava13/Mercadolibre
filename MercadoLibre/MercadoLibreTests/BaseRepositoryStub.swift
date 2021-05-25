//
//  BaseRepositoryStub.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Combine

class BaseRepositoryStub<T: Codable> {
    
    enum Reponse {
        case failure(Error)
        case success(T)
    }
    
    var response: Reponse  = .failure(TestError.notFound)
    
    func execute() -> AnyPublisher<T, Error> {
        Future<T,Error> { emitter in
            switch self.response {
            case .failure(let error):
                emitter(.failure(error))
            case .success(let value):
                emitter(.success(value))
            }
        }.eraseToAnyPublisher()
    }

}
