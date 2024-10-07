//
//  Models.swift
//  RecipesList
//
//  Created by Asaf Weinberg on 10/6/24.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable {
    let cuisine: String
    let name: String
    let photo_url_large: String
    let photo_url_small: String
    let source_url: String?
    let uuid: String
    let youtube_url: String?
}

extension Recipe: Identifiable {
    var id: String { return uuid }
}
