//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FoodListView: View {

    @EnvironmentObject var modelData: ModelData
    @State private var currentIndex = 0
    @State private var isListViewActive = false
    var foodCategory : [String] = ["한식","양식","중식","일식","기타", "카페/디저트"]
    @State private var foodFilterResult = foodFilter()
    
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

    @MainActor
    private func foodList() -> some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                ForEach($foodFilterResult[currentIndex], id: \.self) {
                    value in
                    NavigationLink {
                        FoodInfoView(foodInfo: value.wrappedValue)
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
                                        .frame(width: 300, height: 300, alignment: .center)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .padding(.bottom, 15)
                    }
                }
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}

