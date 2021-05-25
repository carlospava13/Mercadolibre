//
//  ApiClientTest.swift
//  MLDataTests
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
@testable import MLData
import XCTest
final class ApiClientTest: XCTestCase {
    var urlSessionMock: URLSessionMock!
    var sut: APIClienting!
    var subscriptions: Set<AnyCancellable>?

    override func setUp() {
        super.setUp()
        urlSessionMock = URLSessionMock()
        sut = APIClient(session: urlSessionMock)
        subscriptions = Set<AnyCancellable>()
    }

    override func tearDown() {
        sut = nil
        subscriptions = nil
        urlSessionMock = nil
        super.tearDown()
    }

    func testApiClient_WhenReturSuccess_ThenGetJson() {
        // Given
        let expectation = self.expectation(description: "api client test")
        let endpointBuilder = EndPointBuilder()
        // When
        urlSessionMock.jsonFile = .category
        sut.execute(endpointBuilder.build()).sink { completion in
            switch completion {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        } receiveValue: { (result: [APICategoryModel]) in
            print(result)
        }.store(in: &subscriptions!)

        // Then
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testApiClient_WhenFailureWithBadRequest_ThenGet400StatusCode() {
        // Given
        let expectation = self.expectation(description: "api client test")
        let endpointBuilder = EndPointBuilder()
        var valueExpected: HTTPStatusCode?
        // When
        urlSessionMock.response = .failure(400)
        sut.execute(endpointBuilder.build()).sink { completion in
            switch completion {
            case .failure(let error):
                valueExpected = HTTPStatusCode(rawValue: error._code)
                expectation.fulfill()
            case .finished:
                XCTFail()
            }
        } receiveValue: { (result: [APICategoryModel]) in
            print(result)
        }.store(in: &subscriptions!)

        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(valueExpected, .badRequest)
    }
    
    func testApiClient_WhenFailureWithBadURl_ThenGetNotFoundError() {
        // Given
        let expectation = self.expectation(description: "api client test")
        let endpointBuilderStub = EndPointBuilderStub()
        let endpointBuilder = EndPointBuilder(urlEndPoint: endpointBuilderStub)
        urlSessionMock.jsonFile = .category
        let urlBuilder = endpointBuilder.build()
        endpointBuilderStub.stringURL = ""
        var valueExpected: HTTPStatusCode?
        // When
        //urlSessionMock.response = .failure(400)

        sut.execute(urlBuilder).sink { completion in
            switch completion {
            case .failure(let error):
                valueExpected = HTTPStatusCode(rawValue: error._code)
                expectation.fulfill()
            case .finished:
                XCTFail()
            }
        } receiveValue: { (result: [APICategoryModel]) in
            print(result)
        }.store(in: &subscriptions!)

        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(valueExpected, .notFound)
    }
}

final class EndPointBuilderStub: EndPointBuilderAble {
    var stringURL: String = ""
}
