//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    @ObservedObject var modelData: GlobalModelData
    @Binding var property: Properties

    var body: some View {
        Button {
            property.favorite.checkbox.toggle()

        } label: {
            Image(systemName: property.favorite.checkbox ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(property.favorite.checkbox ? .pink : .gray)
        }
    }
}
