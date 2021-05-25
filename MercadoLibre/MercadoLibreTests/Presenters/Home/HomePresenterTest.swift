//
//  HomePresenterTest.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Combine
import XCTest
@testable import MercadoLibre
@testable import MLData
final class HomePresenterTest: XCTestCase {
    
    var repository:GetCategoryRepositoryStub!
    var coordinatorSpy: HomeCoordinatorSpy!
    var homeViewSpy: HomeViewSpy!
    var sut: HomePresentering!
        
    
    override func setUp() {
        super.setUp()
        repository = GetCategoryRepositoryStub()
        coordinatorSpy = HomeCoordinatorSpy()
        homeViewSpy = HomeViewSpy()
        let dependencies = HomePresenter.InputDependencies(coordinator: coordinatorSpy,
                                                           repository: repository)
        sut = HomePresenter(dependencies: dependencies)
    }
    
    override func tearDown() {
        repository = nil
        coordinatorSpy = nil
        homeViewSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func testSetTitle_WhenViewDidLoadIsCalled_ThenCallSetTitle() {
        //Given
        let expectation = self.expectation(description: "present test")
        var valueExpected: String?
        //When
        homeViewSpy.setTitleCallBack = { title in
            valueExpected = title
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testGetCategories_WhenViewDidLoadIsCalled_ThenCallShowLoading() {
        //Given
        let expectation = self.expectation(description: "present test")
        var valueExpected = false
        //When
        
        homeViewSpy.showLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetCategories_WhenViewDidLoadIsCalled_ThenSetCategories() {
        //Given
        let expectation = self.expectation(description: "present test")
        repository.response = .success(TestConstants.categories)
        var valueExpected: [CategoryModel] = []
        //When
        
        homeViewSpy.setCategoriesCallBack = { categories in
            valueExpected = categories
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertGreaterThan(valueExpected.count, 0)
    }
    
    func testGetCategories_WhenViewDidLoadIsCalled_ThenCallHideLoading() {
        //Given
        let expectation = self.expectation(description: "present test")
        repository.response = .success(TestConstants.categories)
        var valueExpected = false
        //When
        
        homeViewSpy.showLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetCategorySelected_WhenViewDidLoadIsCalled_ThenShowCategory() {
        //Given
        let expectation = self.expectation(description: "present test")
        repository.response = .success(TestConstants.categories)
        var valueExpected: CategoryModel?
        //When
        
        homeViewSpy.setCategoriesCallBack = { categories in
            self.sut.categorySelected(model: categories.first!)
        }
        
        coordinatorSpy.showCategoryCallBack = { category in
            valueExpected = category
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.viewDidLoad()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(valueExpected)
    }
    
    func testShowSearch_WhenViewDidLoadIsCalled_ThenCallHideLoading() {
        //Given
        let expectation = self.expectation(description: "present test")
        repository.response = .success(TestConstants.categories)
        var valueExpected = false
        //When
        
        coordinatorSpy.showSearchCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
    
        sut.bind(view: homeViewSpy)
        sut.showSearch()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
}

extension HomePresenterTest {
    final class GetCategoryRepositoryStub: BaseRepositoryStub<[APICategoryModel]>, GetCategoryRepositoring{
        func getCategories() -> AnyPublisher<[APICategoryModel], Error> {
            execute()
        }
    }
}
