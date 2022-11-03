//
//  FoodInfoViewReco.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//
import Kingfisher
import SwiftUI

struct RestaurantInfoView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData : ModelData
    @State var foodInformation : Properties

    var foodInformationIndex: Int {
        modelData.localData.firstIndex(where: { $0.id.number == foodInformation.id.number })!
    }

    var propertyIndex: Int {
        modelData.localData.firstIndex(where: {$0.id.number == foodInformation.id.number})!
    }

    var body: some View {
            VStack{
                foodTitleAndImage()
                foodDescription()
                dismissButton()
                Spacer()
            }
    }

    private func foodTitleAndImage() -> some View {
        VStack {
            HStack {
                Text("\(foodInformation.name.title.first!.text.content)")
                    .customTitle()
                    .lineLimit(1)
                    .allowsTightening(true)

                Spacer()

                FavoriteButton(modelData: modelData, property: $modelData.localData[foodInformationIndex])
            }
            .frame(width: 250, alignment: .leading)

            KFImage(URL(string: foodInformation.imageFile.files.first!.file.url))
                    .placeholder { //플레이스 홀더 설정
                        VStack {
                            Text("이미지를 받아오고 있어요!")
                            ProgressView()
                        }
                    }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                    .onSuccess {r in //성공
                        print("succes: \(r)")
                    }
                    .onFailure { e in //실패
                        print("failure: \(e)")
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300)
                    .cornerRadius(20)
                    .padding(20)
        }
        .padding(.top, 10)
        .background(.orange.opacity(0.06))
        .cornerRadius(15)
    }

    private func foodDescription() -> some View {
        VStack {
                VStack(alignment: .leading, spacing: 5) {

                    Text("가격 : \(foodInformation.price.select.name)")
                        .descriptionTextStyle()

                    Text("위치 : \(foodInformation.location.richText.first!.text.content)")
                        .descriptionTextStyle()

                    Text("리뷰 : \(foodInformation.propertiesDescription.richText.first!.text.content)")
                        .descriptionTextStyle()
                }
                .frame(width: 300, alignment: .leading)
                .padding(.leading,30)
                .padding(.vertical , 10)
                .background(.orange.opacity(0.06))
                .cornerRadius(15)
        }
        .padding()
    }

    private func dismissButton() -> some View {
        Button {
            dismiss()
        } label: {
            Text("다른 맛집을 살펴볼래요!")
                .customButtonFormat()
        }
    }
}
