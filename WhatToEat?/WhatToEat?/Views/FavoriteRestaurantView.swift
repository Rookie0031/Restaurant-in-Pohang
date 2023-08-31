//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FavoriteRestaurantView: View {

    @ObservedObject var vm: FoodListVM
    
    var body: some View {
        NavigationView {
            if !vm.isLoading {
                List(vm.favorites, id: \.id.number) {restaurant in
                    NavigationLink{
                        RestaurantInfoView(foodInformation: restaurant)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        RestaurantInfoRow(restaurant: restaurant)
                    }
                }
                .navigationTitle("먹킷리스트")
            } else {
                ProgressView("먹킷리스트를 받아오고 있어요!")
            }
        }
        .onAppear {
            vm.loadFavorites(pageIdList: favoriteFoods)
        }
    }
}
