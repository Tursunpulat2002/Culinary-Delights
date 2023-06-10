//
//  RecipesManager.swift
//  Culinary Delights
//
//  Created by Tursunpulat Orolov on 6/7/23.
//

import Foundation
import SwiftUI

class RecipesManager: ObservableObject{
    // Declare needed variables
    @Published var categories: [Category] = [] // store all recieved categories
    @Published var meals: [Meal] = [] // store all recieved meals
    @Published var recipe: Recipe = Recipe.standard // store recieved recipe
    let mealURL: String = "https://themealdb.com/api/json/v1/1/filter.php?c=" // url base to get specific category of meals
    let recipeURL: String = "https://themealdb.com/api/json/v1/1/lookup.php?i=" // url base to get specific category of recipes
    
    init(){
        // load categories when app is opened
        getCategories()
    }
    
    // function to get recipe for given recipeurl which is a specific meal
    func getRecipe(recipeurl: String){
        // check if url is valid
        guard let url = URL(string: recipeurl) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        // get the data and response
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // check if there is no error
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            // check if response is good
            if response.statusCode == 200 {
                // check if data exists
                guard let data = data else { return }
                
                // on main thread parse data using Recipes and save into recipe
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Recipes.self, from: data)
                        self.recipe = returns.recipes.first! // ! used because already checked data
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    // function to get meals for a specific category given mealurl
    func getMeals(mealurl: String){
        // check if url is valid
        guard let url = URL(string: mealurl) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        // get the data and response
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // check if there is no error
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            // check if response is good
            if response.statusCode == 200 {
                // check if data exists
                guard let data = data else { return }
                
                // on main thread parse data using Meals and save into meals
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Meals.self, from: data)
                        self.meals = returns.meals.sorted { $0.strMeal < $1.strMeal } // sort alphabetically before saving
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    // function to get all categories
    func getCategories(){
        // check if url is valid
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/categories.php") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        // get the data and response
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // check if there is no error
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            // check if response is good
            if response.statusCode == 200 {
                // check if data exists
                guard let data = data else { return }
                
                // on main thread parse data using Categories and save into categories
                DispatchQueue.main.async {
                    do {
                        let returns = try JSONDecoder().decode(Categories.self, from: data)
                        self.categories = returns.categories.sorted { $0.strCategory < $1.strCategory } // sort alphabetically before saving
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
