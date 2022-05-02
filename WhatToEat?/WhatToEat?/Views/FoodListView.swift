//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FoodListView: View {
    
    var foodCategory : [String] = ["양식","한식","중식","일식","아시안", "카페/디저트"]

    private static let initialColumns = 2
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var foodList = ["참서리", "Europe", "South America", "North America", "Africa", "Middle East", "1","2","3","4","5","6"]
    
    @State var currentIndex = 0
    @State var isListViewActive = false


    var body: some View {
        
        NavigationView {
            
        VStack(alignment:.leading, spacing: 10) {

            
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
            
            
            ScrollView {
                LazyVStack(alignment: .center) {
                    ForEach(foodList, id: \.self) {
                           value in
                           Button(action: {
                               currentIndex = foodList.firstIndex(of: value)!
                               isListViewActive = true
                           }) {
                               VStack() {
                               Image("참서리")
                                   .resizable()
                                   .customImageLazyOneCol()
                               Text(value)
                                       .foregroundColor(.black)
                               }
                           }
                        }
                    }
            }
                
            
//            ScrollView {
//            LazyVGrid(columns: gridColumns) {
//                ForEach(foodList, id: \.self) {
//                    value in
//                    Button(action: {
//                        currentIndex = foodList.firstIndex(of: value)!
//                        isListViewActive = true
//                    }) {
//                        VStack {
//                        Image("참서리")
//                            .customImageList()
//                        Text(value)
//                        }
//                    }                }
//            }
//        }
//                }
//                .padding(.leading, 5)
//                .navigationBarTitle("어떤 맛집이 있을까요?")
        }
        .navigationTitle("어떤 맛집이 있을까요?")
            
    }
}
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
