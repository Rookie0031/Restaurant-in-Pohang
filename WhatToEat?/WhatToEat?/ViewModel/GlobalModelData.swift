//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Foundation

final class GlobalModelData: ObservableObject {

    @Published var serverData: [Properties] = []
    @Published var categoryFood: [[Properties]] = []
    @Published var localData: [Properties] = []

    @MainActor
    func queryEntireNotionDB() async {

        let request = NSMutableURLRequest(url: NSURL(string: DataBaseInfo.readURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = DataBaseInfo.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request as URLRequest)

            guard let decodedData = try? JSONDecoder().decode(ExampleDTO.self, from: data) else { throw NetworkError.decoidngError }

            let httpResponse = response as! HTTPURLResponse
            if !(200...299).contains(httpResponse.statusCode) {
                throw NetworkError.responseError
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
            
            self.categoryFood.append(western)
            self.categoryFood.append(korean)
            self.categoryFood.append(chinese)
            self.categoryFood.append(japanese)
            self.categoryFood.append(cafe)
            self.categoryFood.append(asian)
            
            print("foodCategory에 Properties를 모두 추가했습니다 \(categoryFood.count)")
            
        } catch NetworkError.decoidngError {
            print(NetworkError.decoidngError.localizedDescription)
        } catch NetworkError.responseError {
            print(NetworkError.responseError.localizedDescription)
        } catch {
            print(error)
        }
    }
}
