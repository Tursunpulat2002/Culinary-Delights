//
//  RecipeModel.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation

// Dynamic codingkeys to decode ingredients and measurements from JSON response into a single array
struct DynamicKey1: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "strIngredient\(intValue)"
    }
}

struct DynamicKey2: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "strMeasure\(intValue)"
    }
}

// Recipe struct to decode JSON response
struct Recipe: Codable, Identifiable {
    let id: String
    let strMeal: String
    let strCategory: String
    let strArea: String?
    let strInstructions: String
    let instructions: [String]
    let strIngredient: [String]
    var ingredients: [String] = []
    let strMeasure: [String]
    var measurements: [String] = []
    let strMealThumb: String?
    let strYoutube: String?
    
    // example init for recipe to be used while testing
    static let standard = Recipe(id: "0", meal: "", cat: "", area: "", inst: "", inst2: [], ingred: [], meas: [], thumb: "", yout: "")
    
    // CodingKeys to match preferred variable names to JSON key values
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strCategory, strArea, strInstructions, strIngredient, strMeasure, strMealThumb, strYoutube
    }
    
    // Standard initializer
    init(id: String, meal:String, cat: String, area: String, inst: String, inst2: [String], ingred: [String], meas: [String], thumb: String, yout: String){
        self.id = id
        self.strMeal = meal
        self.strCategory = cat
        self.strArea = area
        self.strInstructions = inst
        self.instructions = inst2
        self.strIngredient = ingred
        self.strMeasure = meas
        self.strMealThumb = thumb
        self.strYoutube = yout
    }
    
    // Decoder initializer
    init(from decoder: Decoder) throws {
        // Decode response into 3 seperate containers for regular keys, ingredients, and measurements
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dynamicContainer1 = try decoder.container(keyedBy: DynamicKey1.self)
        let dynamicContainer2 = try decoder.container(keyedBy: DynamicKey2.self)
        
        id = try container.decode(String.self, forKey: .id)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        
        // instructions variable to break up huge strInstructions into array of seperate instructions
        instructions = strInstructions.components(separatedBy: "\n")
        
        // Save ingredients 1,..,20 into array
        strIngredient = (1...20).compactMap { index in
            guard let ingredient = try? dynamicContainer1.decodeIfPresent(String.self, forKey: DynamicKey1(stringValue: "strIngredient\(index)")!) else {
                return nil
            }
            return ingredient
        }
        
        // Get rid of null values for ingredients
        for i in strIngredient{
            if i != ""{
                ingredients.append(i)
            }
        }
        
        // Save measurements 1,..,20 into array
        strMeasure = (1...20).compactMap { index in
            guard let measure = try? dynamicContainer2.decodeIfPresent(String.self, forKey: DynamicKey2(stringValue: "strMeasure\(index)")!) else {
                return nil
            }
            return measure
        }
        
        // Get rid of null values measurements
        for i in strMeasure{
            if i != " "{
                measurements.append(i)
            }
        }
    }
}

// Need this to correctly decode JSON response
struct Recipes: Codable{
    let recipes: [Recipe]
    
    // CodingKeys to match preferred variable names to JSON key values
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
}

// Meal struct to decode JSON response
struct Meal: Codable, Identifiable {
    var id: String
    let strMeal: String
    let strMealThumb: String
    
    // example init for meal to be used while testing
    static let standard = Meal(id: "52874", strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    
    // CodingKeys to match preferred variable names to JSON key values
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
}

// Need this to correctly decode JSON response
struct Meals: Codable {
    let meals: [Meal]
}

// Category struct to decode JSON response
struct Category: Codable, Identifiable {
    var id: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    // example init for meal to be used while testing
    static let standard = Category(id: "100", strCategory: "Beef", strCategoryThumb: "https://www.themealdb.com/images/category/beef.png", strCategoryDescription: "Beef Meat")
    
    // CodingKeys to match preferred variable names to JSON key values
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
}

// Need this to correctly decode JSON response
struct Categories: Codable {
    let categories: [Category]
}
