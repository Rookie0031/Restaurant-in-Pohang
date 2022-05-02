//
//  LoadingView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
    
        VStack {
            
            Text("맛집을 선정 중이에요!")
                .customTitle()
            
            Image("참서리")
                .resizable()
                .customImageDetail()
            
            Text("어떤 음식이 나올까요...")
                .customInfoContent2()
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
