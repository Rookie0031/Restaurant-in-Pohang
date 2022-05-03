//
//  RestaurantView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import SwiftUI

struct FoodInfoView: View {
    
    var foodInfo : RestaurantData
    
    @State var isActive : Bool = false
    var body: some View {
        
        VStack {
            Text("\(foodInfo.name) 어때요?")
                .customTitle()
            
//            Text("📍 Capital : \(countryInfo.capital)")
            
            foodInfo.image
                .resizable()
                .customImageDetail()
            
            VStack(alignment: .leading) {
            Text("추천메뉴 : \(foodInfo.name)")
                .customInfoContent2()
            
            Text("가격 : \(foodInfo.price)")
            .customInfoContent2()

            Text("위치 : \(foodInfo.location)")
                .customInfoContent2()
                
            Text("리뷰 : \(foodInfo.description)")
                .customInfoContent2()
        

            }
            .frame(width: 300, alignment: .leading)
            .padding(.leading,10)
            
            NavigationLink(destination: MainPageView(), isActive: $isActive) {
                Button(action: {
                    isActive = true
                }) {
                    Text("나의 먹킷리스트에 추가!")
                        .customButtonFormat()
                }
            }
            
            NavigationLink(destination: MainPageView()) {
                    Text("다른 맛집도 알고 싶어요!")
                        .customButtonFormat()
                }
        }
            
            

        }
    }

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoView(foodInfo: restaurants[3])
            .previewInterfaceOrientation(.portrait)
    }
}
