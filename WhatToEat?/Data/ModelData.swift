//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Foundation

final class ModelData: ObservableObject {
    @Published var foodData: [Properties] = []
    @Published var foodCategoryFiltered: [[Properties]] = []
    @Published var favoriteRestaurants: [Properties] = ModelData.getFavoritesRestaurants()

    static func getFavoritesRestaurants() -> [Properties] {
        var returnData: [Properties] = []
        if UserDefaults.standard.object(forKey: "likes") as? Data == nil {
            print("UserDefault에 저장된 값이 없어요")
            return []
        } else {
            print("likes로 저장된 값이 있네요 ")
            do {
                let storedData = UserDefaults.standard.object(forKey: "likes") as! Data
                print("저장된 값을 가져왔습니다 \(storedData)")
                let decodedData = try JSONDecoder().decode([Properties].self, from: storedData)
                print("디코딩된 값을 가져왔습니다 \(decodedData)")
                returnData = decodedData
            } catch {
                fatalError("No stored Data")
            }
        }
        return returnData
    }

    func getFromNotionDB() async {
        let token = "secret_iDuf0tFUBdrlNDjOL7LhL2uUOr0tkSEC7f9DttlAKEx"
        let databaseID = "206c4793c7e6428eb8235279a3e445af"
        let readURL = "https://api.notion.com/v1/databases/\(databaseID)/query"
        let headers = [
            "Authorization": "Bearer " + token,
            "Notion-Version": "2022-06-28"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: readURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers

        do {
            let (data, response) = try await URLSession.shared.data(for: request as URLRequest)
            print("전송받은 응답입니다.")
            print(response)
            print("=================================================")
            print("받은 데이터는 다음과 같습니다 \(data)")

            guard let decodedData = try? JSONDecoder().decode(ExampleDTO.self, from: data) else {
                print("디코딩에 실패했습니다")
                return
            }

            var western : [Properties] = []
            var korean : [Properties] = []
            var chinese : [Properties] = []
            var japanese : [Properties] = []
            var asian : [Properties] = []
            var cafe : [Properties] = []

            for data in decodedData.results {
                // Properties 전부 기록
                self.foodData.append(data.properties)

                switch data.properties.category.select.name {
                case "양식" :
                    western.append(data.properties)
                case "한식" :
                    korean.append(data.properties)
                case "중식" :
                    chinese.append(data.properties)
                case "일식" :
                    japanese.append(data.properties)
                case "기타" :
                    asian.append(data.properties)
                case "카페/디저트" :
                    cafe.append(data.properties)
                default :
                    print("정보에 오류가 있는 거 같아요.")
                }
            }
            print("foodData에 Properties를 모두 추가했습니다 \(foodData)")

            self.foodCategoryFiltered.append(western)
            self.foodCategoryFiltered.append(korean)
            self.foodCategoryFiltered.append(chinese)
            self.foodCategoryFiltered.append(japanese)
            self.foodCategoryFiltered.append(cafe)

            print("foodCategory에 Properties를 모두 추가했습니다 \(foodCategoryFiltered)")

        } catch {
            print("Invalid Service")
        }
    }
}

