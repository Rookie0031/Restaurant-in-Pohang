//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//
import SwiftUI

struct RestaurantListView: View {

    @ObservedObject var modelData: ModelData
    @State var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                FoodCategories()
                RestaurantList()
            }
            .navigationTitle("맛집 둘러보기")
        }
    }
}

