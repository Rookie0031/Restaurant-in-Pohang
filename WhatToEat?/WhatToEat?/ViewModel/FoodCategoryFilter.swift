//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Foundation

final class FoodCategoryFilter {
    
    static let instance = FoodCategoryFilter()
    
    @MainActor
    func queryFoods(category: String) async -> [Properties] {
        
        var foodsData: [Properties] = []
        
        let filterParameter = """
            {
              "filter": {
                "property": "category",
                "select": {
                  "equals": \(category)
                }
              }
            }
            """.data(using: .utf8) ?? Data()
        
        let request = NSMutableURLRequest(url: NSURL(string: DataBaseInfo.readURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = DataBaseInfo.headers
        request.httpBody = filterParameter
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request as URLRequest)

            let httpResponse = response as! HTTPURLResponse
            if !(200...299).contains(httpResponse.statusCode) {
                throw NetworkError.responseError
            }
            print(httpResponse.statusCode)
            print("data \(data)")
            
            guard let decodedData = try? JSONDecoder().decode(Test.self, from: data) else { throw
                NetworkError.decoidngError }
            
            for data in decodedData.results {
                foodsData.append(data.properties)
            }
            
            
        } catch NetworkError.decoidngError {
            print(NetworkError.decoidngError.localizedDescription)
        } catch NetworkError.responseError {
            print(NetworkError.responseError.localizedDescription)
        } catch {
            print(error)
        }
        
        return foodsData
    }
}
