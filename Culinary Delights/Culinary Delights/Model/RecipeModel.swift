//
//  RecipeModel.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strIngredient: [String]
    let strMeasure: [String]
    let strMealThumb: String
    let strYoutube: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strCategory
        case strArea
        case strInstructions
        case strIngredient
        case strMeasure
        case strMealThumb
        case strYoutube
    }
}

struct Recipes: Codable{
    let recipes: [Recipe]
}

struct Meal: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    var id: String
    
    static let standard = Meal(strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg", id: "52874")
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
}

struct Meals: Codable {
    let meals: [Meal]
}

struct Category: Codable, Identifiable {
    var id: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    static let standard = Category(id: "100", strCategory: "Beef", strCategoryThumb: "", strCategoryDescription: "Beef Meat")
    
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
