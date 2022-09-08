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
    var foodInfo : Properties
    var foodInfoIndex: Int {
        modelData.foodData.firstIndex(where: { $0.id.number == foodInfo.id.number })!
    }
    
    var body: some View {
        
        if foodInfo.id.number < 100 {
            VStack {
                    VStack{
                        HStack {
                            Text("\(foodInfo.name.title.first!.text.content)")
                                .customTitle()
//                                .minimumScaleFactor(0.8)
                                .lineLimit(2)
                                .allowsTightening(false)
                            
                            Spacer()
                            
                            FavoriteButton(isFavorite: $modelData.foodData[foodInfoIndex].isFavorite)
                        }
                        .frame(width: 250, alignment: .leading)

                        // MARK: 이미지 넣기
                        AsyncImage(url: URL(string: foodInfo.imageName.richText.first!.text.content)) { image in image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
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
                                
                                Text("가격 : \(foodInfo.price.select.name)")
                                    .descriptionTextStyle()

                                Text("위치 : \(foodInfo.price.select.name)")
                                    .descriptionTextStyle()

                                Text("리뷰 : \(foodInfo.propertiesDescription.richText.first!.text.content)")
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
