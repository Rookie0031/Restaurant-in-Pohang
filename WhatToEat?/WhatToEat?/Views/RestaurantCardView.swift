//
//  RestaurantCardView.swift
//  WhatToEat?
//
//  Created by 장지수 on 2022/11/02.
//
import SwiftUI
import Kingfisher

struct RestaurantCardView: View {
    var restaurant: Properties

    var body: some View {

        ZStack {

            ZStack {
                KFImage(URL(string: restaurant.imageFile.files.first!.file.url))
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
                    .cancelOnDisappear(false)
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
