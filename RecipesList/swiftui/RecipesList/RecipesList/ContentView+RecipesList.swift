//
//  ContentView+RecipesList.swift
//  RecipesList
//
//  Created by Asaf Weinberg on 10/6/24.
//

import UIKit

//MARK: - RecipesList

extension ContentView: RecipesList {

    func updatList() {
        Task {
            do {
                recipes = try await getRecipes()
            } catch _ {
                isError = true
            }
        }
    }
}
