//
//  FavoriteButtonBox.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/05.
//
import SwiftUI

struct FavoriteButtonSub: View {
    @Binding var isFavorite: Bool
    // 이 구조체의 인풋으로 isSet이 필요한데... 근데 왜 여기 바인딩이 필요하지??
    
    var body: some View {
        Button(action: {
            isFavorite.toggle()
        }) {
            Text("먹킷리스트에 추가할까요?")
                .customButtonFormat()
        }
    }
}

struct FavoriteButtonBox_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonSub(isFavorite: .constant(true))
    }
}

