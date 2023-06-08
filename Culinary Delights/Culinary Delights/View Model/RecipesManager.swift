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
    
    init(){
        getCategories()
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
                        self.categories = returns.categories
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
}
