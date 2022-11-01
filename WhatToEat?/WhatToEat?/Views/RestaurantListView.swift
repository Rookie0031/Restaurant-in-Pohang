//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//
import NukeUI
import SwiftUI

struct RestaurantListView: View {

    @ObservedObject var modelData: RestaurantListViewModel
    @State var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 10) {
                foodCategoryChoice()
                foodList()
            }
            .navigationTitle("맛집을 둘러보세요!")
        }
    }
}

