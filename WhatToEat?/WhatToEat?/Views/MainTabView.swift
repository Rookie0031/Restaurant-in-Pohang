//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel: FoodListVM = FoodListVM()
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = false

    var body: some View {
        TabView {
            RestaurantListView(vm: viewModel)
                .tabItem { Label("맛집", systemImage: "house")}
            RecommendView(foodListVM: viewModel)
                .tabItem { Label("추천", systemImage: "square.text.square") }
            FavoriteRestaurantView(vm: viewModel)
                .tabItem { Label("먹킷리스트", systemImage: "person")}
        }
        .onAppear {
            if let encodedData = UserDefaults.standard.data(forKey: "MyFavorites"),
               let decodedArray = try? JSONDecoder().decode([String].self, from: encodedData) {
                favoriteFoods = decodedArray
                viewModel.loadFavorites(pageIdList: favoriteFoods)
            }
        }
    }
}
