//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct BucketListView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    private var filteredRestaurants: [Properties] {
        modelData.foodData.filter { data in
            (!showFavoritesOnly || data.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredRestaurants, id: \.id.number) {restaurant in
                NavigationLink{
                    FoodInfoView(foodInformation: restaurant)
                } label: {
                    InformationRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("먹킷리스트를 관리해봐요!")
        }
    }
}
