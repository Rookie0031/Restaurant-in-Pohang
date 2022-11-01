//
//  RestaurantListViewExtension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/30.
//
//import NukeUI
import SwiftUI
import Foundation

extension RestaurantListView {
    func foodCategoryChoice() -> some View {
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
        .padding(.leading, 20)
        .padding(.bottom, 10)
    }

    func foodList() -> some View {
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

                                    Image(uiImage: modelData.loadCachedImage(imageURL: URL(string: value.wrappedValue.imageFile.files.first!.file.url)!))

                                    //                                    LazyImage(source: value.wrappedValue.imageFile.files.first!.file.url) { state in
                                    //                                        if let image = state.image {
                                    //                                            image
                                    //                                        } else if state.error != nil {
                                    //                                            AsyncImage(url: URL(string: value.wrappedValue.imageFile.files.first!.file.url)) { image in
                                    //                                                image
                                    //                                            } placeholder: {
                                    //                                                ProgressView()
                                    //                                            }
                                    //
                                    //                                        } else {
                                    //                                            Text("이미지를 받아오고 있어요!")
                                    //                                        }
                                }
                                .frame(width: 220, height: 220)
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.bottom, 15)
                }
                //                } else {
                //                    ProgressView()
                //                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6, alignment: .center)
                //                }
            }
        }
    }
}
