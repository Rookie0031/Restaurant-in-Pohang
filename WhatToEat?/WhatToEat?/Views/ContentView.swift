//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingDetailView = false
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            TabView {
                RecommendView()
                    .tabItem { Label("추천", systemImage: "house") }
                FoodListView()
                    .tabItem { Label("맛집", systemImage: "square.text.square")}
                BucketListView()
                    .tabItem { Label("먹킷리스트", systemImage: "person")}
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
