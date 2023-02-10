//
//  RestaurantCardView.swift
//  WhatToEat?
//
//  Created by 장지수 on 2022/11/02.
//
import SwiftUI
import Kingfisher

struct RestaurantCardView: View {
    let restaurant: Properties

    var body: some View {

        ZStack {
            ZStack {
                KFImage(URL(string: restaurant.imageFile.files.first!.file.url))
                    .placeholder {
                        VStack {
                            Text("이미지를 받아오고 있어요!")
                            ProgressView()
                        }
                    }
                    .retry(RetryWhenFailed())
                    .retry(maxCount: 3, interval: .seconds(10))
                    .onFailure { print("failure: \($0)") }
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width * 0.75)
                    .cornerRadius(12)
            }

            Text("\(restaurant.name.title.first!.text.content)")
                .foregroundColor(.white)
                .font(.system(size: 32).weight(.heavy))
                .frame(width: 300, alignment: .leading)
                .offset(y: 100)
        }
    }
}
