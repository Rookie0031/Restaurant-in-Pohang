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
    
    private var filteredRestaurants: [RestaurantData] {
        modelData.restaurants.filter { value in
            (!showFavoritesOnly || value.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredRestaurants, id: \.id) {restaurant in
                NavigationLink{
                    FoodInfoView(foodInfo: restaurant)
                } label: {
                    InformationRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("먹킷리스트를 관리해봐요!")
        }
    }
}
