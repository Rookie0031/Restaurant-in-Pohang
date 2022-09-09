//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI

@MainActor
final class ModelData: ObservableObject {
    @Published var foodData: [Properties] = []

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

            for data in decodedData.results {
                self.foodData.append(data.properties)
            }
            print("foodData에 Properties를 모두 추가했습니다 \(foodData)")
        } catch {
            print("Invalid Service")
        }
    }
}

@MainActor
func foodFilter () -> [[Properties]] {
    var western : [Properties] = []
    var korean : [Properties] = []
    var chinese : [Properties] = []
    var japanese : [Properties] = []
    var asian : [Properties] = []
    var cafe : [Properties] = []


    if !ModelData().foodData.isEmpty {
        for num in 0...ModelData().foodData.count - 1 {
            switch ModelData().foodData[num].category.select.name {
            case "양식" :
                western.append(ModelData().foodData[num])
            case "한식" :
                korean.append(ModelData().foodData[num])
            case "중식" :
                chinese.append(ModelData().foodData[num])
            case "일식" :
                japanese.append(ModelData().foodData[num])
            case "기타" :
                asian.append(ModelData().foodData[num])
            case "카페/디저트" :
                cafe.append(ModelData().foodData[num])
            default :
                print("정보에 오류가 있는 거 같아요.")
            }
        }
    }
    return [korean, western, chinese, japanese, asian, cafe]
}

