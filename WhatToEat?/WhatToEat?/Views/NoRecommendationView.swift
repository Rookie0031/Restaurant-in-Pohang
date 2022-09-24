//
//  NoRecoView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/05.
//
//
import SwiftUI

struct NoRecommendationView: View {
    
    @State private var testfor = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData : ModelData
    var body: some View {
        
        VStack {
            Spacer()

            Text("아쉽게도 원하시는 맛집이 없어요...")
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
//
//struct NoRecoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoRecoView()
//    }
//}