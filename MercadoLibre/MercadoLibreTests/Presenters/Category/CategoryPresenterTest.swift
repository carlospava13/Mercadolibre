//
//  CategoryPresenterTest.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Combine
import XCTest
@testable import MercadoLibre
@testable import MLData
final class CategoryPresenterTest: XCTestCase {
    
    var repository:GetProductByCategoryRepositoryStub!
    var coordinatorSpy: CategoryCoordinatorSpy!
    var categoryViewSpy: CategoryViewSpy!
    var sut: CategoryPresentering!
        
    
    override func setUp() {
        super.setUp()
        repository = GetProductByCategoryRepositoryStub()
        coordinatorSpy = CategoryCoordinatorSpy()
        categoryViewSpy = CategoryViewSpy()
        let categoryDummy = CategoryModel(id: "MCO441917", title: "Agro")
        let dependencies = CategoryPresenter.InputDependencies(coordinator: coordinatorSpy,
                                                               category: categoryDummy, repository: repository)
        sut = CategoryPresenter(dependencies: dependencies)
    }
    
    override func tearDown() {
        repository = nil
        coordinatorSpy = nil
        categoryViewSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func testSetTitle_WhenViewDidLoadIsCalled_ThenSetTitle() {
        //Given
        let expection = self.expectation(description: "presenter test")
        var valueExpected: String?
        //When
        categoryViewSpy.setTitleCallBack = { title in
            valueExpected = title
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testGetProducts_WhenViewDidLoadIsCalled_ThenCallShowLoading() {
        //Given
        let expection = self.expectation(description: "presenter test")
        var valueExpected = false
        //When
        categoryViewSpy.showLoadingCallBack = {
            valueExpected = true
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetProducts_WhenViewDidLoadIsCalled_ThenCallSetupProduct() {
        //Given
        let expection = self.expectation(description: "presenter test")
        repository.response = .success(TestConstants.productResult)
        var valueExpected: [ProductModel] = []
        //When
        categoryViewSpy.setupProductCallBack = { products in
            valueExpected = products
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertGreaterThan(valueExpected.count, 0)
    }
    
    func testGetProducts_WhenViewDidLoadIsCalled_ThenCallSeHideLoading () {
        //Given
        let expection = self.expectation(description: "presenter test")
        repository.response = .success(TestConstants.productResult)
        var valueExpected = false
        //When
        categoryViewSpy.hideLoadingCallBack = {
            valueExpected = true
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetProducts_WhenProductIsSelected_ThenCallShowProduct() {
        //Given
        let expection = self.expectation(description: "presenter test")
        repository.response = .success(TestConstants.productResult)
        var valueExpected: String?
        //When
        
        categoryViewSpy.setupProductCallBack = { products in
            self.sut.productSelected(products.first!)
        }
        
        coordinatorSpy.showProductCallBack = { product in
            valueExpected = product
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testShowSearch_WhenIsCalled_ThenCallShowSearch() {
        //Given
        let expection = self.expectation(description: "presenter test")
        repository.response = .success(TestConstants.productResult)
        var valueExpected = false
        //When
        
        coordinatorSpy.showSearchCallBack = {
            valueExpected = true
            expection.fulfill()
        }
        
        sut.bind(view: categoryViewSpy)
        sut.showSearch()
        //Then
        wait(for: [expection], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }

}

extension CategoryPresenterTest {
    final class GetProductByCategoryRepositoryStub:BaseRepositoryStub<APIProductResultModel>, GetProductByCategoryRepositoring {
        func getProducts(categoryId: String) -> AnyPublisher<APIProductResultModel, Error> {
            execute()
        }
    }
}
