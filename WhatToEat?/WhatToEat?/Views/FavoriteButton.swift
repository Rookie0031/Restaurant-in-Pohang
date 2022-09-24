//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {

    @ObservedObject var modelData: ModelData
    @Binding var isFavorite: Bool
    var property: Properties

    var body: some View {
        Button {
            isFavorite.toggle()

            if !property.isFavorite {
                modelData.favoriteRestaurants.append(property)
            } else {
                guard let propertyIndex = modelData.favoriteRestaurants.first(where: {$0.id.number == property.id.number}) else { return }
                modelData.favoriteRestaurants.remove(at: propertyIndex.id.number)
            }
        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isFavorite ? .yellow : .gray)
        }
    }
}
