//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    // 이 구조체의 인풋으로 isSet이 필요한데... 근데 왜 여기 바인딩이 필요하지?? 

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
