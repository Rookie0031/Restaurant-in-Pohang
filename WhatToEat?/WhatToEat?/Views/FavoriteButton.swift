//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorite: Bool = false
    

    var body: some View {
        Button {

        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isFavorite ? .pink : .gray)
        }
    }
}
