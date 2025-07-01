//
//  CalculatorSwiftUITests.swift
//  CalculatorSwiftUITests
//
//  Created by apple on 30/06/25.
//


import XCTest
@testable import CalculatorSwiftUI

final class CalculatorSwiftUITests: XCTestCase {

    var calculator: CalculatorSwiftUI!

    override func setUp() {
        super.setUp()
        calculator = CalculatorSwiftUI()
    }

    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    func testEmptyStringReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }

    func testSingleNumberReturnsItself() throws {
        XCTAssertEqual(try calculator.add("5"), 5)
    }

    func testTwoNumbersCommaSeparated() throws {
        XCTAssertEqual(try calculator.add("1,2"), 3)
    }

    func testMultipleNumbersCommaSeparated() throws {
        XCTAssertEqual(try calculator.add("1,2,3,4"), 10)
    }

    func testNewlineAsDelimiter() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6)
    }

    func testCustomDelimiterSemicolon() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
    }

    func testCustomDelimiterPipe() throws {
        XCTAssertEqual(try calculator.add("//|\n1|2|3"), 6)
    }

    func testNegativeNumberThrowsError() {
        XCTAssertThrowsError(try calculator.add("1,-2")) { error in
            let expected = "negative numbers not allowed -2"
            XCTAssertEqual(error.localizedDescription, expected)
        }
    }

    func testMultipleNegativeNumbersThrowsAll() {
        XCTAssertThrowsError(try calculator.add("-1,-2,3")) { error in
            let expected = "negative numbers not allowed -1,-2"
            XCTAssertEqual(error.localizedDescription, expected)
        }
    }

    func testCustomDelimiterAndNewLineTogether() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2\n3"), 6)
    }
}
