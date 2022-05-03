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
                FoodListView().tabItem { Image(systemName: "square.text.square") }.tag(1)

                MainPageView().tabItem { Image(systemName: "house") }.tag(2)
                BucketListView().tabItem { Image(systemName: "person") }.tag(3)

            }
            .navigationTitle(selection == 1 ? "어떤 맛집이 있을까요?" : selection == 2 ? "맛집을 찾아봐요!" : "나의 먹킷리스트")
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
