//
//  Persistence.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/11/27.
//
import SwiftUI
import Foundation

final class Persistence {

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("restaurants.data")
    }

    // persistence
    static func loadLocalData(completion: @escaping (Result<[Properties], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                // Because restaurants.data doesn’t exist when a user launches the app for the first time, you call the completion handler with an empty array if there’s an error opening the file handle.
                // Reference: https://developer.apple.com/tutorials/app-dev-training/persisting-data
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
}
