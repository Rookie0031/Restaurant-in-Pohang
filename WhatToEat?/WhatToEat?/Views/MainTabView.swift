//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        TabView {
            RecommendView(modelData: modelData)
                .tabItem { Label("추천", systemImage: "house") }
            RestaurantListView(modelData: modelData)
                .tabItem { Label("맛집", systemImage: "square.text.square")}
            FavoriteRestaurantView(modelData: modelData)
                .tabItem { Label("먹킷리스트", systemImage: "person")}
        }
        .task {
            if modelData.localData.isEmpty {
                await modelData.getFromNotionDB()
                modelData.localData = modelData.serverData
                print("서버에 저장된 값으로 대체했습니다!")
            }
        }
    }
}
