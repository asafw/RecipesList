//
//  RecipesListProtocolTests.swift
//  RecipesListTests
//
//  Created by Asaf Weinberg on 10/6/24.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import RecipesList

class RecipesListTests: XCTestCase {

    private class RecipesListMock: RecipesList { }

    override func setUp() {
        HTTPStubs.removeAllStubs()
    }

    func testGetRecipes() {
        let expectation = self.expectation(description: "get recipes")
        addStub(condition: isAbsoluteURLString("https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"), filePath: "recipes.json", statusCode: 200)

        Task {
            do {
                let recipes = try await RecipesListMock().getRecipes()
                expectation.fulfill()
                if recipes.count != 65 {
                    XCTFail("recipes count incorrect")
                }
            } catch let error {
                expectation.fulfill()
                XCTFail(error.localizedDescription)

            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetRecipesEmpty() {
        let expectation = self.expectation(description: "get recipes empty")
        addStub(condition: isAbsoluteURLString("https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"), filePath: "recipes-empty.json", statusCode: 200)

        Task {
            do {
                let recipes = try await RecipesListMock().getRecipes()
                expectation.fulfill()
                if recipes.count != 0 {
                    XCTFail("recipes count incorrect")
                }
            } catch let error {
                expectation.fulfill()
                XCTFail(error.localizedDescription)

            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetRecipesMalformed() {
        let expectation = self.expectation(description: "get recipes malformed")
        addStub(condition: isAbsoluteURLString("https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"), filePath: "recipes-malformed.json", statusCode: 200)

        Task {
            do {
                let _ = try await RecipesListMock().getRecipes()
                expectation.fulfill()
                XCTFail("Malformed json should not pass")
            } catch _ {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
