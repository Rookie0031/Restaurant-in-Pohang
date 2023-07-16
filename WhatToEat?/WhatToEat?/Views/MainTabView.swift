//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
import SwiftUI

struct MainTabView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = false

    var body: some View {
        TabView {
            RestaurantListView()
                .tabItem { Label("맛집", systemImage: "house")}
            RecommendView()
                .tabItem { Label("추천", systemImage: "square.text.square") }
            FavoriteRestaurantView()
                .tabItem { Label("먹킷리스트", systemImage: "person")}
        }
    }
}
