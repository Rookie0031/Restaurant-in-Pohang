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
    @ObservedObject var viewModel: FoodListVM
    var foodInformation : Properties

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.orange.opacity(0.07))
                .cornerRadius(20)

            VStack {
                FoodTitleAndImage()
                FoodDescription()
                Spacer()
            }
            .padding(.top, 40)
        }
        .padding()
    }

    private func FoodTitleAndImage() -> some View {
        VStack {
            HStack {
                Text("\(foodInformation.name.title.first!.text.content)")
                    .customTitle()
                    .lineLimit(1)
                    .allowsTightening(true)

                Spacer()

                FavoriteButton(pageId: foodInformation.imageName.richText.first!.plainText, data: foodInformation, vm: viewModel)
            }
            .frame(width: 270, alignment: .leading)

            KFImage(URL(string: foodInformation.imageFile.files.first!.file.url))
                .retry(RetryWhenFailed())
                .retry(maxCount: 3, interval: .seconds(10))
                .placeholder {
                    VStack {
                        Text("이미지를 받아오고 있어요!")
                        ProgressView()
                    }
                }
                .onFailure { print("failure: \($0)")}
                .resizable()
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
        }
        .padding(.top, 10)
        .cornerRadius(15)
    }

    private func FoodDescription() -> some View {
        VStack(alignment: .leading, spacing: 10) {

            HStack {
                Image(systemName: "menucard.fill")
                    .foregroundColor(.orange)
                    .opacity(0.8)

                Text("가격 : ")
                    .descriptionTextStyle()

                Text("\(foodInformation.price.select.name)")
                    .font(.system(size: 20, weight: .semibold))
            }

            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.orange)
                    .opacity(0.8)

                Text("위치 : ")
                    .descriptionTextStyle()

                Text("\(foodInformation.location.richText.first!.text.content)")
                    .font(.system(size: 20, weight: .semibold))
            }

            HStack(alignment: .center) {
                Image(systemName: "ellipsis.message.fill")
                    .foregroundColor(.orange)
                    .opacity(0.8)

                Text("리뷰 : ")
                    .descriptionTextStyle()
            }

            Text("\(foodInformation.description.richText.first!.text.content)")
                .font(.system(size: 20, weight: .semibold))
        }
        .frame(width: 300, alignment: .leading)
        .padding(.vertical , 10)
        .cornerRadius(15)
    }
}
