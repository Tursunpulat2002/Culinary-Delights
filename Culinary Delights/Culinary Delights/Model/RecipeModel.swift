//
//  RecipeModel.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation

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

struct Recipe: Codable, Identifiable {
    let id: String
    let strMeal: String
    let strCategory: String
    let strArea: String?
    let strInstructions: String
    let strIngredient: [String]
    let strMeasure: [String]
    let strMealThumb: String?
    let strYoutube: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strCategory, strArea, strInstructions, strIngredient, strMeasure, strMealThumb, strYoutube
    }
    
    init(id: String, meal:String, cat: String, area: String, inst: String, ingred: [String], meas: [String], thumb: String, yout: String){
        self.id = id
        self.strMeal = meal
        self.strCategory = cat
        self.strArea = area
        self.strInstructions = inst
        self.strIngredient = ingred
        self.strMeasure = meas
        self.strMealThumb = thumb
        self.strYoutube = yout
    }
    
    init(from decoder: Decoder) throws {
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
        
        strIngredient = (1...20).compactMap { index in
            guard let ingredient = try? dynamicContainer1.decodeIfPresent(String.self, forKey: DynamicKey1(stringValue: "strIngredient\(index)")!) else {
                return nil
            }
            return ingredient
        }
        
        strMeasure = (1...20).compactMap { index in
            guard let measure = try? dynamicContainer2.decodeIfPresent(String.self, forKey: DynamicKey2(stringValue: "strMeasure\(index)")!) else {
                return nil
            }
            return measure
        }
    }
}

struct Recipes: Codable{
    let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
}

struct Meal: Codable, Identifiable {
    var id: String
    let strMeal: String
    let strMealThumb: String
    
    static let standard = Meal(id: "52874", strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    
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
    
    static let standard = Category(id: "100", strCategory: "Beef", strCategoryThumb: "https://www.themealdb.com/images/category/beef.png", strCategoryDescription: "Beef Meat")
    
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
