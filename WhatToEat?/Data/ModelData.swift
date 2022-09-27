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

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("TestData.data")
    }

    static func loadLocalData(completion: @escaping (Result<[Properties], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let restaurantsData = try JSONDecoder().decode([Properties].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(restaurantsData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    static func saveLocalData(data: [Properties], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                print("최종 저장전 확인")
                print(data.filter({$0.favorite.checkbox == true}).count)
                let restaurants = try JSONEncoder().encode(data)
                let outfile = try fileURL()
                try restaurants.write(to: outfile)
                print("저장이 성공햇어요!")
                DispatchQueue.main.async {
                    completion(.success(restaurants.count))
                }
            } catch {
                print("저장 실패")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    @MainActor
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
                case "기타" :
                    asian.append(data.properties)
                case "카페/디저트" :
                    cafe.append(data.properties)
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
            print("foodCategory에 Properties를 모두 추가했습니다 \(foodCategoryFiltered.count)")

        } catch {
            print("Invalid Service")
        }
    }
}
