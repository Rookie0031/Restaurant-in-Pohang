//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1
    @State private var isShowingDetailView = false
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selection) {
                RecommendView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9, alignment: .center)
                    .tabItem { Label("추천", systemImage: "house") }.tag(1)
                FoodListView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .top)
                    .tabItem { Label("맛집", systemImage: "square.text.square")}.tag(2)
                BucketListView().tabItem { Label("먹킷리스트", systemImage: "person")}.tag(3)
            }
            .navigationTitle(selection == 1 ? "맛집을 추천드릴게요!" : selection == 2 ? "포항 맛집을 살펴보세요!" : "나의 먹킷리스트")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
