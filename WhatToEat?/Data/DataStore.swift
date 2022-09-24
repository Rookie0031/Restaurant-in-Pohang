////
////  DataStore.swift
////  WhatToEat?
////
////  Created by Jisu Jang on 2022/09/24.
////
//import SwiftUI
//import Foundation
//
//class FoodDataStore: ObservableObject {
//    @Published var foodData: [Properties] = []
//
//    private static func fileURL() throws -> URL {
//        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("foodData.data")
//    }
//
//    static func load(completion: @escaping (Result<[Properties], Error>)->Void) {
//        DispatchQueue.global(qos: .background).async {
//            do {
//                let fileURL = try fileURL()
//                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
//                    DispatchQueue.main.async {
//                        completion(.success([]))
//                    }
//                    return
//                }
//                let foodData = try JSONDecoder().decode([Properties].self, from: file.availableData)
//                DispatchQueue.main.async {
//                    completion(.success(foodData))
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
//
//    static func save(foodData: [Properties], completion: @escaping (Result<Int, Error>)->Void) {
//        DispatchQueue.global(qos: .background).async {
//            do {
//                let data = try JSONEncoder().encode(foodData)
//                let outfile = try fileURL()
//                try data.write(to: outfile)
//                DispatchQueue.main.async {
//                    completion(.success(foodData.count))
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
//
//}
