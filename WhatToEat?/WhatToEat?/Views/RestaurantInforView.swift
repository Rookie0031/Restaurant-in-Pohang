//
//  FoodInfoViewReco.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//

import SwiftUI

struct RestaurantInforView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData : ModelData
    @State private var isActive : Bool = false
    var foodInformation : Properties
    var foodInformationIndex: Int {
        modelData.foodData.firstIndex(where: { $0.id.number == foodInformation.id.number })!
    }
    
    var body: some View {
        
        if foodInformation.id.number < 100 {
            VStack {
                    VStack{
                        HStack {
                            Text("\(foodInformation.name.title.first!.text.content)")
                                .customTitle()
//                                .minimumScaleFactor(0.8)
                                .lineLimit(2)
                                .allowsTightening(false)
                            
                            Spacer()
                            
                            FavoriteButton(modelData: modelData, isFavorite: $modelData.foodData[foodInformationIndex].isFavorite, property: foodInformation)
                        }
                        .frame(width: 250, alignment: .leading)

                        // MARK: 이미지 넣기
//                        imageFile.files.first!.file.url
                        AsyncImage(url: URL(string: foodInformation.imageFile.files.first!.file.url)) { image in image
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
                                
                                Text("가격 : \(foodInformation.price.select.name)")
                                    .descriptionTextStyle()

                                Text("위치 : \(foodInformation.price.select.name)")
                                    .descriptionTextStyle()

                                Text("리뷰 : \(foodInformation.propertiesDescription.richText.first!.text.content)")
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
                }
            }
        } else {
            NoRecommendationView()
        }

    }

}
