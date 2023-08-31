//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI
import Combine

final class FoodListVM: ObservableObject {

    @Published var foods: [Properties] = []
    @Published var favorites: [Properties] = []
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()

    func queryFoods(category: String) {
        let parameters = "{\n\"filter\": {\n\"property\": \"category\",\n\"select\": {\n\"equals\": \"\(category)\"\n}\n}\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.notion.com/v1/databases/\(DataBaseInfo.databaseID)/query")!,timeoutInterval: Double.infinity)
        request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(DataBaseInfo.token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = postData

        // MARK: 만약 아래 코드로 작성하면 모든 데이터가 수신됨
        // request.allHTTPHeaderFields = DataBaseInfo.headers

        self.isLoading = true

        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap(handleOutput)
            .decode(type: NotionDTO.self, decoder: JSONDecoder())
            .map { decodedData in
                decodedData.results.map { $0.properties }
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
            } receiveValue: { [weak self] result in
                print("receive value work")
                self?.foods = result
            }
            .store(in: &cancellables)
    }

    func loadFavorites(pageIdList: [String]) {
        for pageId in pageIdList {
            let parameters = "{\n  \"filter\": {\n    \"property\": \"imageName\",\n    \"rich_text\": {\n      \"contains\": \"\(pageId)\"\n    }\n  }\n}"
            let postData = parameters.data(using: .utf8)
            var request = URLRequest(url: URL(string: "https://api.notion.com/v1/databases/\(DataBaseInfo.databaseID)/query")!,timeoutInterval: Double.infinity)
            request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(DataBaseInfo.token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "POST"
            request.httpBody = postData

            self.isLoading = true
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap(handleOutput)
                .decode(type: NotionDTO.self, decoder: JSONDecoder())
                .map { decodedData in
                    decodedData.results.map { $0.properties }
                }
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    self.isLoading = false
                } receiveValue: { [weak self] result in
                    print("receive result work")
                    var isDuplicated: Bool = false
                    let names = self!.favorites
                        .map { $0.imageName.richText.first!.plainText }
                    let loadedNames = result
                        .map { $0.imageName.richText.first!.plainText }

                    for name in loadedNames {
                        if names.contains(name) {
                            print("Duplicated")
                            isDuplicated = true
                        }
                    }

                    if !isDuplicated {
                        self?.favorites += result
                    }
                }
                .store(in: &cancellables)
        }
    }

    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
