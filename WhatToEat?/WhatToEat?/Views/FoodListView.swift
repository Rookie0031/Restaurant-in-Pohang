//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FoodListView: View {
    
    var foodCategory : [String] = ["한식","양식","중식","일식","기타", "카페/디저트"]
    
    
    @State private var foodFilterResult = foodFilter()
    
    @State var currentIndex = 0
    @State var isListViewActive = false
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
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
                            ForEach(foodFilterResult[currentIndex], id: \.self) {
                                value in
                                
                                NavigationLink {
                                    FoodInfoViewRecoSecond(foodInfo: ModelData().restaurants.filter{$0.name == value}.first!)
                                    
                                } label: {
                                    
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(.orange).opacity(0.06)
                                            .frame(width: 350, height: 280)
                                        
                                        VStack() {
                                            
                                            Text("\(value)")
                                                .foregroundColor(.black)
                                                .padding(.bottom, -3)
                                                .font(.system(size: 20).weight(.heavy))
                                                .frame(width: 300, alignment: .leading)
                                            
                                            Image(value)
                                                .resizable()
                                                .customImageLazyOneCol()
                                            
                                            
                                        }
                                        
                                    }
                                    .padding(.bottom, 15)
                                    
                                }
                                
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
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

