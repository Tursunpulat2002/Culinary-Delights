//
//  RecipeModel.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation

struct Recipe: Identifiable {
    let id: Int
    let name: String
    let catergory: String
    let country: String
    let instructions: String
    let ingredients: [String]
    let amounts: [String]
    let img: String
    let youtube: String
    let source: String
}

struct Category: Codable, Identifiable {
    var id: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
}

struct Categories: Codable {
    let categories: [Category]
}
