//
//  RecipesManager.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation
import SwiftUI

class RecipesManager: ObservableObject{
    @Published var categories: [Category] = []
    @Published var meals: [Meal] = []
    @Published var recipe: [Recipe] = []
    let mealURL: String = "https://themealdb.com/api/json/v1/1/filter.php?c="
    let recipeURL: String = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    init(){
        getCategories()
    }
    
    func getRecipe(recipeurl: String){
        guard let url = URL(string: recipeurl) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Recipes.self, from: data)
                        self.recipe = returns.recipes
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func getMeals(mealurl: String){
        guard let url = URL(string: mealurl) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Meals.self, from: data)
                        self.meals = returns.meals.sorted { $0.strMeal < $1.strMeal }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func getCategories(){
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/categories.php") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Categories.self, from: data)
                        self.categories = returns.categories.sorted { $0.strCategory < $1.strCategory }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
