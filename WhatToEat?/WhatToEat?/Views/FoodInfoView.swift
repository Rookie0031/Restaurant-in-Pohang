//
//  RestaurantView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import SwiftUI

struct FoodInfoView: View {
    
    @EnvironmentObject var modelData : ModelData
    var foodInfo : RestaurantData
    var foodInfoIndex: Int {
         modelData.restaurants.firstIndex(where: { $0.id == foodInfo.id })!
     }
    
    @State var isActive : Bool = false
    var body: some View {
        
        VStack {
            HStack {
                Text("\(foodInfo.name) 어때요?")
                    .customTitle()
                Spacer()
                
                FavoriteButton(isSet: $modelData.restaurants[foodInfoIndex].isFavorite)
            }
            .frame(width: 300, alignment: .leading)
            
            foodInfo.image
                .resizable()
                .customImageDetail()
            
            Group {
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
            }
            
            
            NavigationLink{
                BucketListView()
//                    .navigationBarHidden(true)
            } label:{
                    Text("먹킷리스트로 가볼까요?")
                        .customButtonFormat()
                }
            
            NavigationLink{
                MainPageView()
//                    .navigationBarHidden(true)
            } label: {
                    Text("취향별로 맛집을 추천받아보세요!")
                        .customButtonFormat()
                }
            
            }
        }
            
            

        }

struct RestaurantView_Previews: PreviewProvider {
    static var restaurants = ModelData().restaurants
    static var previews: some View {
        
        FoodInfoView(foodInfo: restaurants[3])
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
