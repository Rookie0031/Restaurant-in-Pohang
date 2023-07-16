//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FavoriteRestaurantView: View {
    
    private var favoriteRestaurants: [Properties] = []
    
    var body: some View {
        NavigationView {
            List(favoriteRestaurants, id: \.id.number) {restaurant in
                NavigationLink{
                    RestaurantInfoView(foodInformation: restaurant)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    RestaurantInfoRow(restaurant: restaurant)
                }
            }
            .navigationTitle("먹킷리스트")
        }
    }
}
