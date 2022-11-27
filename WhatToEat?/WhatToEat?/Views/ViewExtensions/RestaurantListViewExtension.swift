//
//  RestaurantListViewExtension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/30.
//
import Kingfisher
import SwiftUI
import Foundation

extension RestaurantListView {
    func FoodCategories() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(foodCategory, id: \.self) { value in
                    Button(action: {
                        currentIndex = foodCategory.firstIndex(of: value)!
                        print(currentIndex)
                    }) {
                        foodCategory.firstIndex(of: value)! == currentIndex ?

                        Text(value)
                            .customCategory()
                            .foregroundColor(.white )
                            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                        :
                        Text(value)
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

    func RestaurantList() -> some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                if !modelData.foodCategoryFiltered.isEmpty {
                    ForEach($modelData.foodCategoryFiltered[currentIndex], id: \.self) {
                        value in
                        NavigationLink {
                            RestaurantInfoView(foodInformation: value.wrappedValue)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            RestaurantCardView(restaurant: value.wrappedValue)
                        }
                        .padding(.bottom, 15)
                    }
                } else {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6, alignment: .center)
                }
            }
        }
    }
}
