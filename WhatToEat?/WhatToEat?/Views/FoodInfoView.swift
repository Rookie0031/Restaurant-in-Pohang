//
//  FoodInfoViewReco.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//

import SwiftUI

struct FoodInfoView: View {
    @State var isActive : Bool = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData : ModelData
    var foodInfo : RestaurantData
    var foodInfoIndex: Int {
        modelData.restaurants.firstIndex(where: { $0.id == foodInfo.id })!
    }
    
    var body: some View {
        
        if foodInfo.id < 100 {
            VStack {
                    VStack{
                        HStack {
                            Text("\(foodInfo.name) 어때요?")
                                .customTitle()
                                .lineLimit(2)
                                .allowsTightening(false)
                            
                            Spacer()
                            
                            FavoriteButton(isFavorite: $modelData.restaurants[foodInfoIndex].isFavorite)
                        }
                        .frame(width: 250, alignment: .leading)

                        foodInfo.image
                            .resizable()
                            .customImageDetail()
                    }
                    .frame(width: 300)
                    .padding(.bottom, 20)
                    .padding(.vertical , 10)
                    .background(.orange.opacity(0.06))
                    .cornerRadius(15)

                VStack {
                    Group {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("가게이름 : \(foodInfo.name)")
                                    .descriptionTextStyle()
                                
                                Text("가격 : \(foodInfo.price)")
                                    .descriptionTextStyle()

                                Text("위치 : \(foodInfo.location)")
                                    .descriptionTextStyle()

                                Text("리뷰 : \(foodInfo.description)")
                                    .descriptionTextStyle()
                            }
                            .frame(width: 270, alignment: .leading)
                            .padding(.leading,30)
                            .padding(.vertical , 10)
                            .background(.orange.opacity(0.06))
                            .cornerRadius(15)
                    }
                }
                .padding()

                Group {
                    Button {
                        dismiss()
                    } label: {
                        Text("다른 맛집을 살펴볼래요!")
                            .customButtonFormat()
                    }

                    NavigationLink{
                        BucketListView()
                            .navigationTitle("뭘 먹을까?")
                    } label: {
                        Text("먹킷리스트로 가볼래요!")
                            .customButtonFormat()
                    }
                }
            }
        } else {
            NoRecommendationView()
        }

    }

}

struct RestaurantVie11w2_Previews: PreviewProvider {
    static var restaurants = ModelData().restaurants
    static var previews: some View {
        
        FoodInfoView(foodInfo: restaurants[3])
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
