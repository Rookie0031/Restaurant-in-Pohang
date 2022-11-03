//
//  RestaurantCardView.swift
//  WhatToEat?
//
//  Created by 장지수 on 2022/11/02.
//
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

                CacheAsyncImage(
                    url: URL(string: restaurant.imageFile.files.first!.file.url)!
                ) { phase in
                    switch phase {
                    case .success(let image):
                        // MARK: 각각의 사진 클릭시, 나오는 detial View 사진
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                            .clipped()
                            .border(Color.gray, width: 0.45)

                    case .failure(let error):
                        Text(error.localizedDescription)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.4, alignment: .center)

                    case .empty:
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                    @unknown default:
                        Image(systemName: "questionmark")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                            .clipped()
                            .border(Color.gray, width: 0.45)
                    }
                }
            }
        }
    }
}
