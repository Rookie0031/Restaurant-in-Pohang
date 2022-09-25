//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct RestaurantListView: View {

    @ObservedObject var modelData: ModelData
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 10) {
                foodCategoryChoice()
                foodList()
            }
            .navigationTitle("맛집을 둘러보세요!")
        }
    }

    private func foodCategoryChoice() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(foodCategory, id: \.self) { value in
                    Button(action: {
                        currentIndex = foodCategory.firstIndex(of: value)!
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
        .padding(.leading, 20)
        .padding(.bottom, 10)
    }

    private func foodList() -> some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                if !modelData.foodCategoryFiltered.isEmpty {
                    ForEach($modelData.foodCategoryFiltered[currentIndex], id: \.self) {
                        value in
                        NavigationLink {
                            RestaurantInfoView(foodInformation: value.wrappedValue)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.orange).opacity(0.06)
                                    .frame(width: 350, height: 280)

                                VStack(alignment: .leading) {
                                    Text("\(value.wrappedValue.name.title.first!.text.content)")
                                        .foregroundColor(.black)
                                        .padding(.bottom, -3)
                                        .font(.system(size: 20).weight(.heavy))
                                        .frame(width: 300, alignment: .leading)

                                    AsyncImage(url: URL(string: value.wrappedValue.imageFile.files.first!.file.url)) { image in image
                                            .resizable()
                                            .frame(width: 220, height: 220, alignment: .center)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
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

