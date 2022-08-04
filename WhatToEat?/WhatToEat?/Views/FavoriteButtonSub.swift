//
//  FavoriteButtonBox.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/05.
//
import SwiftUI

struct FavoriteButtonSub: View {
    @Binding var isFavorite: Bool
    
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

