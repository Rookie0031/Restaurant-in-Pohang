//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//
import SwiftUI

struct RestaurantListView: View {

    @ObservedObject var modelData: GlobalModelData
    @State private var showModal = false
    @State var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                FoodCategories()
                RestaurantList()
            }
            .navigationTitle("맛집 둘러보기")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showModal.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        .sheet(isPresented: $showModal) {
            PostMatZip()
        }
    }
}
