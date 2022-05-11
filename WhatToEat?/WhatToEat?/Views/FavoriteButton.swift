//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isFavorite ? .yellow : .gray)
        }
    }
}

//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton(isSet: .constant(true))
//    }
//}
