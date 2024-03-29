//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = false
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        TabView {
            RestaurantListView(modelData: modelData)
                .tabItem { Label("맛집", systemImage: "house")}
            RecommendView(modelData: modelData)
                .tabItem { Label("추천", systemImage: "square.text.square") }
            FavoriteRestaurantView(modelData: modelData)
                .tabItem { Label("먹킷리스트", systemImage: "person")}
        }
        .task {
            if !isFirstLaunch {
                await modelData.getFromNotionDB()
                modelData.localData = modelData.serverData
                isFirstLaunch = true
            }
        }
    }
}
