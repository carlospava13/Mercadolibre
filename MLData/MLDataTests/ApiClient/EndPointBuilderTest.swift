//
//  EndPointBuilderTest.swift
//  MLDataTests
//
//  Created by Carlos Pava on 23/05/21.
//

@testable import MLData
import XCTest

final class EndPointBuilderTest: XCTestCase {
    var sut: EndPointBuilder!

    override func setUp() {
        super.setUp()
        sut = EndPointBuilder()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testBuilUrl_WhenAddEndpointDescription_ThenGetUrl() {
        // Given
        let id = "MCO509093160"
        let valueExpected = "https://api.mercadolibre.com/items/\(id)/descriptions"
        // When
        let builder = sut.add(.items).add(id).add(.descriptions).build()
        // Then
        XCTAssertEqual(valueExpected, builder.stringURL)
    }
    
    func testBuilUrl_WhenAddEndpointSearch_ThenGetUrl() {
        // Given
        let valueExpected = "https://api.mercadolibre.com/sites/MCO/search?q="
        // When
        let builder = sut.add(.sites).add(.siteID).add(.search).build()
        // Then
        XCTAssertEqual(valueExpected, builder.stringURL)
    }
}
