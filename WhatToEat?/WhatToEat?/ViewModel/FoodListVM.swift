//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Foundation

final class FoodListVM: ObservableObject {

    @Published var foods: [Properties] = []

    func queryFoods(category: String) {
        var result: [Properties] = []
        let parameters = "{\n\"filter\": {\n\"property\": \"category\",\n\"select\": {\n\"equals\": \"\(category)\"\n}\n}\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.notion.com/v1/databases/\(DataBaseInfo.databaseID)/query")!,timeoutInterval: Double.infinity)
        request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(DataBaseInfo.token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = postData

        // 만약 이 코드로 작성하면 모든 데이터가 수신됨
        // request.allHTTPHeaderFields = DataBaseInfo.headers

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            print("data is this \(data)")
            do {
                let decodedData = try JSONDecoder().decode(Test.self, from: data)
                for datum in decodedData.results {
                    result.append(datum.properties)
                }
                DispatchQueue.main.async {
                    self.foods = result
                }
            } catch {
                print("decoing error")
                print(error)
            }
        }
        print("before task resume \(result.count)")
        task.resume()
    }
}
