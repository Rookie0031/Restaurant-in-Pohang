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
    
    var filteredRestaurants: [RestaurantData] {
        modelData.restaurants.filter { value in
            (!showFavoritesOnly || value.isFavorite)
        }
    }
    
    var body: some View {
        
        List(filteredRestaurants, id: \.id) {restaurant in
            InformationRowView(restaurant: restaurant)
        }
        
    }
}

struct BucketListView_Previews: PreviewProvider {
    
    static var previews: some View {
        BucketListView()
            .environmentObject(ModelData())
        
    }
}
