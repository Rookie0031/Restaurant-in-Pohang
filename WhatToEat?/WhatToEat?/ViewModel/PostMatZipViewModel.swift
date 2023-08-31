//
//  PostMatZipViewModel.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//
import SwiftUI

final class PostMatZipViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var transportation: String = ""
    @Published var category: String = ""
    @Published var people: String = ""
    @Published var price: String = ""
    @Published var location: String = ""
    @Published var description: String = ""
    @Published var name: String = ""
    @Published var imageData: String = ""
    
//    func createNotionPage() {
//        let token = DataBaseInfo.token
//        let databaseID = DataBaseInfo.databaseID
//
//        do {
//            let headers = [
//                "Authorization": "Bearer " + token,
//                "accept": "application/json",
//                "Notion-Version": "2022-06-28",
//                "content-type": "application/json"
//            ]
//
//            let request = NSMutableURLRequest(url: NSURL(string: "https://api.notion.com/v1/pages")! as URL,
//                                              cachePolicy: .useProtocolCachePolicy,
//                                              timeoutInterval: 10.0)
//
//            let encodedData = DTOModel.generatejsonDocument(databaseID: databaseID, description: self.description, location: self.location, price: self.price, people: self.people, category: self.category, name: self.name, imageData: self.imageData)
//
//            request.httpMethod = "POST"
//            request.httpBody = encodedData
//            request.allHTTPHeaderFields = headers
//
//            let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//                if (error != nil) {
//                    print("통신 과정에서 에러가 났습니다.")
//                    print(error?.localizedDescription ?? "error case occured")
//                } else {
//                    print("response는 다음과 같습니다")
//                    print(response as Any)
//                }
//            })
//            dataTask.resume()
//        }
//    }
}
