//
//  MainPageView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct MainPageView: View {
    
    @State var currentIndex = 0
    @Binding var foodCategory: [String]
    @Binding var peopleCategory: [String]
    @Binding var priceCategory: [String]
    @Binding var locationCategory: [String]
    
    var body: some View {
        
        
        VStack {
            Text("맛집을 찾아서!")
                .customTitle()
                .padding()
            
            
            VStack {
                Text("어떤 음식이 땡기나요?")
                    .customInfoTitle()
                CategoryScrollView(currentIndex: $currentIndex, caseCategory: foodCategory)
                
            }
            .frame(width: 300, alignment: .leading)
            
            
        }
    }
}
//
//struct MainPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPageView(currentIndex: 0, foodCategory: "string", peopleCategory: "string", priceCategory: "string", locationCategory: "string")
//    }
//}


