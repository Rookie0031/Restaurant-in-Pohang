//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct BucketListView: View {

    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var modelData: ModelData
//    private var filteredRestaurants: [Properties] {
//        modelData.foodData.filter { data in
//            data.isFavorite == true
//        }
//    }
    
    var body: some View {
        NavigationView {
            List(modelData.favoriteRestaurants, id: \.id.number) {restaurant in
                NavigationLink{
                    FoodInfoView(foodInformation: restaurant)
                } label: {
                    InformationRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("먹킷리스트를 관리해봐요!")
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveFavoriteRestaurants()
            }
        }
    }

    private func saveFavoriteRestaurants() {
        do {
            let encodedData = try JSONEncoder().encode(modelData.favoriteRestaurants)
            print("UserDefault에 값을 저장합니다 \(encodedData)")
            UserDefaults.standard.setValue(encodedData, forKey: "likes")
        } catch {
            print(error.localizedDescription)
        }
    }
}
