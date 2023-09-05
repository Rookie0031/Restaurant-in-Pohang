//
//  PostMatZipViewModel.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//
import Combine
import SwiftUI

final class PostMatZipViewModel: ObservableObject {
    @Published var foodName: String = ""
    @Published var currentIndex: Int = 0
    @Published var transportation: String = ""
    @Published var category: String = ""
    @Published var people: String = ""
    @Published var price: String = ""
    @Published var location: String = ""
    @Published var description: String = ""
    @Published var name: String = ""
    @Published var imageData: String = ""

    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    func createNotionPage(onCompletion: @escaping ()->()) {
        let parameters = """
            {
                "parent": { "database_id": "\(DataBaseInfo.userSuggestionDatabaseID)" },
                "properties": {
                    "Name": {
                        "title": [
                            {
                                "text": {
                                    "content": "\(foodName)"
                                }
                            }
                        ]
                    },
                    "food_category": {
                        "rich_text": [
                            {
                                "text": {
                                    "content": "\(category)"
                                }
                            }
                        ]
                    },
                    "people": {
                        "rich_text": [
                            {
                                "text": {
                                    "content": "\(people)"
                                }
                            }
                        ]
                    },

                    "price": {
                        "rich_text": [
                            {
                                "text": {
                                    "content": "\(price)"
                                }
                            }
                        ]
                    },
                    "location": {
                        "rich_text": [
                            {
                                "text": {
                                    "content": "\(location)"
                                }
                            }
                        ]
                    },
                    "review": {
                        "rich_text": [
                            {
                                "text": {
                                    "content": "\(description)"
                                }
                            }
                        ]
                    }
                }
            }
            """
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.notion.com/v1/pages")!,timeoutInterval: Double.infinity)
        request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(DataBaseInfo.token, forHTTPHeaderField: "Authorization")
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
                print("User Post completed")
                self.isLoading = false
                onCompletion()
            } receiveValue: { _ in }
            .store(in: &cancellables)
    }

    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
