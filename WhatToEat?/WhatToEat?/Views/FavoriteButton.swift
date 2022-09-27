//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    @ObservedObject var modelData: ModelData
    @Binding var property: Properties

    var body: some View {
        Button {
            property.favorite.checkbox.toggle()

        } label: {
            Label("Toggle Favorite", systemImage: property.favorite.checkbox ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(property.favorite.checkbox ? .yellow : .gray)
        }
    }
}
