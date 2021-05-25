//
//  ProductDetailPresenterTest.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 25/05/21.
//

import Combine
@testable import MercadoLibre
@testable import MLData
import XCTest
final class ProductDetailPresenterTest: XCTestCase {
    var getProductDetailRepositoryStub: GetProductDetailRepositoryStub!
    var getProductDetailDescriptionRepositoryStub: GetProductDetailDescriptionRepositoryStub!
    var productDetailViewSpy: ProductDetailViewSpy!
    var sut: ProductDetailPresentering!

    override func setUp() {
        super.setUp()
        getProductDetailRepositoryStub = GetProductDetailRepositoryStub()
        getProductDetailDescriptionRepositoryStub = GetProductDetailDescriptionRepositoryStub()
        productDetailViewSpy = ProductDetailViewSpy()
        let idProductDummy = "MCO441917"
        let dependencies = ProductDetailPresenter.InputDependencies(
            idProduct: idProductDummy,
            repository: getProductDetailRepositoryStub,
            descriptionRepository: getProductDetailDescriptionRepositoryStub)
        sut = ProductDetailPresenter(dependencies: dependencies)
    }

    override func tearDown() {
        getProductDetailRepositoryStub = nil
        productDetailViewSpy = nil
        getProductDetailDescriptionRepositoryStub = nil
        sut = nil
        super.tearDown()
    }
    
    func testSetTitle_WhenViewDidLoadIsCalled_ThenCallSetTitle() {
        //Given
        let expectation = self.expectation(description: "presenter test")
        var valueExpected: String?
        //When
        productDetailViewSpy.setTitleDescriptionCallBack = { title in
            valueExpected = title
            expectation.fulfill()
        }
        
        sut.bind(view: productDetailViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testGetProduct_WhenViewDidLoadIsCalled_ThenCallSetDetail() {
        //Given
        let expectation = self.expectation(description: "presenter test")
        var valueExpected: ProductDetailModel?
        getProductDetailRepositoryStub.response = .success(TestConstants.producDetail)
        //When
        productDetailViewSpy.setDetailCallBack = { productDetail in
            valueExpected = productDetail
            expectation.fulfill()
        }
        
        sut.bind(view: productDetailViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testGetDescription_WhenViewDidLoadIsCalled_ThenCallSetDescription() {
        //Given
        let expectation = self.expectation(description: "presenter test")
        var valueExpected: String?
        getProductDetailDescriptionRepositoryStub.response = .success(TestConstants.productDescriptions)
        //When
        
        productDetailViewSpy.setDescriptionCallBack = { description in
            valueExpected = description
            expectation.fulfill()
        }
        
        sut.bind(view: productDetailViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
}

extension ProductDetailPresenterTest {
    final class GetProductDetailRepositoryStub: BaseRepositoryStub<APIProductDetailModel>, GetProductDetailRepositoring {
        func getproduct(id: String) -> AnyPublisher<APIProductDetailModel, Error> {
            execute()
        }
    }

    final class GetProductDetailDescriptionRepositoryStub: BaseRepositoryStub<[APIProductDetailDescriptionModel]>, GetProductDetailDescriptionRepositoring {
        func getproduct(id: String) -> AnyPublisher<[APIProductDetailDescriptionModel], Error> {
            execute()
        }
    }
}
