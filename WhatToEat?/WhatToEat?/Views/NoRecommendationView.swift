//
//  NoRecoView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/05.
//
//
import SwiftUI

struct NoRecommendationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            Spacer()

            Text("아쉽게도 원하시는 맛집이 없군요!")
                .font(.system(size: 20).weight(.heavy))
                .padding(.bottom,50)
            
            Image("sorry1")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()

            Button {
                dismiss()
            } label: {
                Text("한번 더 추천받을래요!")
                    .customButtonFormat()
            }
            .padding(.bottom, 40)
        }
    }
    
}
