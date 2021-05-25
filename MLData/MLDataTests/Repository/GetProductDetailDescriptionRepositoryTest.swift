//
//  GetProductDetailDescriptionRepositoryTest.swift
//  MLDataTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Combine
@testable import MLData
import XCTest
final class GetProductDetailDescriptionRepositoryTest: XCTestCase {
    var urlSessionMock: URLSessionMock!
    var sut: GetProductDetailDescriptionRepositoring!
    var subscriptions: Set<AnyCancellable>?

    override func setUp() {
        super.setUp()
        urlSessionMock = URLSessionMock()
        let apiClient = APIClient(session: urlSessionMock)
        sut = GetProductDetailDescriptionRepository(endPointBuilder: EndPointBuilder(), apiClient: apiClient)
        subscriptions = Set<AnyCancellable>()
    }

    override func tearDown() {
        sut = nil
        subscriptions = nil
        urlSessionMock = nil
        super.tearDown()
    }

    func testGetProductDetailDescription_WhenResponseSuccess_ThenGetDescriptionList() {
        // Given
        let expectation = self.expectation(description: "test get categories")
        var valueExpected: [APIProductDetailDescriptionModel]?
        urlSessionMock.jsonFile = .productDescription
        // When
        
        sut.getproduct(id: "MCO23").sink { completion in
            switch completion {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        } receiveValue: { apiCategoryModel in
            valueExpected = apiCategoryModel
        }.store(in: &subscriptions!)

        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
        XCTAssertGreaterThan(valueExpected!.count, 0)
    }

    func testGetProductDetailDescription_WhenResponseFailure_ThenGetError() {
        // Given
        let expectation = self.expectation(description: "test get categories")
        var valueExpected: HTTPStatusCode?
        urlSessionMock.response = .failure(404)
        // When
        sut.getproduct(id: "MCO23").sink { completion in
            switch completion {
            case .failure(let error):
                valueExpected = HTTPStatusCode(rawValue: error._code)
                expectation.fulfill()
            case .finished:
                XCTFail()
            }
        } receiveValue: { _ in
        }.store(in: &subscriptions!)

        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
        XCTAssertEqual(valueExpected, .notFound)
    }
}



