//
//  RecipesListProtocol.swift
//  RecipesList
//
//  Created by Asaf Weinberg on 10/6/24.
//

import UIKit

protocol RecipesList {
    func getRecipes() async throws -> [Recipe]
}

// MARK: - Default protocol implementation

extension RecipesList {
    func getRecipes() async throws -> [Recipe] {
        return try await APIRepository().getRecipes()
    }
}
