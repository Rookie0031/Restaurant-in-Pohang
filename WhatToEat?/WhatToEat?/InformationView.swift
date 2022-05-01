//
//  RestaurantView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import SwiftUI

struct InformationView: View {
    
    @State var isActive : Bool = false
    var body: some View {
        
        VStack {
            Text("참서리는 어때요?")
                .customTitle()
            
            Image("참서리")
                .resizable()
                .customImageDetail()
            
            VStack(alignment: .leading) {
            Text("메인메뉴 : ")
                .customInfoContent2()
            
            Text("가격 : ")
                .customInfoContent2()

            Text("위치 : ")
                .customInfoContent2()
            
            Text("링크!")
                .customInfoContent2()
            }
            .frame(width: 300, alignment: .leading)
            .padding(.leading,10)
            
//            CustomButton(destination: MainPageView(), buttonContent: "나의 먹킷리스트에 추가!")
//
            
            NavigationLink(destination: MainPageView(), isActive: $isActive) {
                Button(action: {
                    isActive = true
                    print("it runs")
                }) {
                    Text("나의 먹킷리스트에 추가!")
                        .customButtonFormat()
                }
            }
            
            NavigationLink(destination: MainPageView()) {
                    Text("다른 맛집도 알고 싶어요!")
                        .customButtonFormat()
                }
        }
            
//            CustomButton(destination: MainPageView(), buttonContent: "나의 먹킷리스트에 추가!")
            
            

        }
    }

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
            .previewInterfaceOrientation(.portrait)
    }
}
