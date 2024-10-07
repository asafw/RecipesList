//
//  XCTestcase+Stubs.swift
//  RecipesListTests
//
//  Created by Asaf Weinberg on 10/6/24.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift

extension XCTestCase {
    func addStub(condition: @escaping HTTPStubsTestBlock, filePath: String, statusCode: Int32 = 200, name: String? = nil) {
        guard let file = OHPathForFile(filePath, type(of: self)) else {
            XCTFail("File not stubbed")
            return
        }
        stub(condition: condition) { req in
            return HTTPStubsResponse(
                fileAtPath: file,
                statusCode: statusCode,
                headers: ["Content-Type":"application/json"])
            }.name = name
    }
}
