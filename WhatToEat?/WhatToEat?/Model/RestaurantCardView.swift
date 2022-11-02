//
//  RestaurantCardView.swift
//  WhatToEat?
//
//  Created by 장지수 on 2022/11/02.
//
import NukeUI
import SwiftUI

struct RestaurantCardView: View {
    var restaurant: Properties
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.orange).opacity(0.06)
                .frame(width: 350, height: 280)
            
            VStack(alignment: .leading) {
                Text("\(restaurant.name.title.first!.text.content)")
                    .foregroundColor(.black)
                    .padding(.bottom, -3)
                    .font(.system(size: 20).weight(.heavy))
                    .frame(width: 300, alignment: .leading)
                
                LazyImage(source: restaurant.imageFile.files.first!.file.url) { state in
                    if let image = state.image {
                        image
                    } else if state.error != nil {
                        AsyncImage(url: URL(string: restaurant.imageFile.files.first!.file.url)) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 220, height: 220)
                    }
                    else {
                        Text("이미지를 받아오고 있어요!")
                    }
                }
                .cornerRadius(12)
            }
        }
    }
}
