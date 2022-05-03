//
//  FoodListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FoodListView: View {
    
    var foodCategory : [String] = ["한식","양식","중식","일식","아시안", "카페/디저트"]

    
    @State private var foodFilterResult = foodFilter()
    
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
                    ForEach(foodFilterResult[currentIndex], id: \.self) {
                           value in
                           Button(action: {
                               print("다른기능이 들어갈 자리입니다. ")
                           }) {
                               VStack() {
                                   Image(value)
                                   .resizable()
                                   .customImageLazyOneCol()
                                   
                               Text(value)
                                       .foregroundColor(.black)
                                       .bold()
                                       .padding(.bottom, 30)
                               }
                           }
                        }
                    }
            }
                
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


//List(self.countryList, id: \.name) { country in
//    country.continent == continentList[currentIndex] ?
//    NavigationLink(destination: CountryInfoView(countryInfo: country)) {
//        GroupBox(label: Text(country.name).font(.system(size: 30)), content: {
//                Image(country.imageURL)
//                    .resizable()
//                    .scaledToFit()
//            })
//            .groupBoxStyle(CustomGroupBox())
//    }
//    : nil
//}
