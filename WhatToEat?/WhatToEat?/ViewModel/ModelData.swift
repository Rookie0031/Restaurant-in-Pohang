//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Foundation

class ModelData: ObservableObject {
    @Published var serverData: [Properties] = []
    @Published var foodCategoryFiltered: [[Properties]] = []
    @Published var localData: [Properties] = []

    var cachedImages = NSCache<NSString, NSData>()
    
    var westernFoodImages: [UIImage] = []
    var koreanFoodImages: [UIImage] = []
    var chineseFoodImages: [UIImage] = []
    var japaneseFoodImages: [UIImage] = []
    var cafeFoodImages: [UIImage] = []
    var asianFoodImages: [UIImage] = []

    @MainActor
    func getFromNotionDB() async {

        let request = NSMutableURLRequest(url: NSURL(string: DataBaseInfo.readURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = DataBaseInfo.headers
        
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
            var cafe : [Properties] = []
            var asian : [Properties] = []
            
            for data in decodedData.results {
                // Properties 전부 기록
                self.serverData.append(data.properties)
                
                switch data.properties.category.select.name {
                case "양식" :
                    western.append(data.properties)
                case "한식" :
                    korean.append(data.properties)
                case "중식" :
                    chinese.append(data.properties)
                case "일식" :
                    japanese.append(data.properties)
                case "카페/디저트" :
                    cafe.append(data.properties)
                case "기타" :
                    asian.append(data.properties)
                default :
                    print("정보에 오류가 있는 거 같아요.")
                }
            }
            print("foodData에 Properties를 모두 추가했습니다 \(serverData.count)")
            
            self.foodCategoryFiltered.append(western)
            self.foodCategoryFiltered.append(korean)
            self.foodCategoryFiltered.append(chinese)
            self.foodCategoryFiltered.append(japanese)
            self.foodCategoryFiltered.append(cafe)
            self.foodCategoryFiltered.append(asian)
            
            print("foodCategory에 Properties를 모두 추가했습니다 \(foodCategoryFiltered.count)")
            
        } catch {
            print(error)
        }
    }
}
