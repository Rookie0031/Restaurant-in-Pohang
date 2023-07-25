//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//
import SwiftUI

struct RestaurantListView: View {
    
    @State private var foodCategory : [String] = ["양식","한식","중식","일식","카페/디저트", "기타"]
    @StateObject private var vm: FoodListVM = FoodListVM()
    @State private var showModal = false
    @State private var currentIndex = 0
    
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
        .onAppear {
            vm.queryFoods(category: foodCategory[0])
        }
    }
    
    private func FoodCategories() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(foodCategory, id: \.self) { category in
                    Button(action: {
                        currentIndex = foodCategory.firstIndex(of: category)!
                        Task {
                            print("data change")
                            vm.queryFoods(category: category)
                            print("data change")
                        }
                    }) {
                        foodCategory.firstIndex(of: category)! == currentIndex ?
                        
                        Text(category)
                            .customCategory()
                            .foregroundColor(.white )
                            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                        :
                        Text(category)
                            .customCategory()
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    }
                }
            }
        }
        .padding(.top, 10)
        .padding(.leading, 20)
        .padding(.bottom, 10)
    }
    
    private func RestaurantList() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center) {
                ForEach(vm.foods, id: \.self) { value in
                    NavigationLink {
                        RestaurantInfoView(foodInformation: value)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        RestaurantCardView(restaurant: value)
                    }
                    .padding(.bottom, 15)
                }
            }
        }
    }
}
