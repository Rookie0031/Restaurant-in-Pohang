//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//
import NukeUI
import SwiftUI

struct RestaurantListView: View {

    @ObservedObject var modelData: ModelData
    @State var currentIndex = 0
    var cache = NSCache<AnyObject, AnyObject>()
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 10) {
                FoodCategories()
                RestaurantList()
            }
            .navigationTitle("맛집 둘러보기")
        }
    }
}

