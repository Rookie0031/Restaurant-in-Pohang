//
//  FoodInfoViewReco.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//
import Kingfisher
import SwiftUI

struct RestaurantInfoRow: View {
    let restaurant : Properties

    var body: some View {
        HStack(spacing: 15) {
            KFImage(URL(string: restaurant.imageFile.files.first!.file.url))
                .placeholder { //플레이스 홀더 설정
                    VStack {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                .onSuccess {r in //성공
                    print("succes:")
                }
                .onFailure { e in //실패
                    print("failure: \(e)")
                }
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            Text(restaurant.name.title.first!.text.content)
                .customInfoContent2()
            
            Spacer()
        }
    }
}
