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
            changeStateOfFavorite()
            isFavorite.toggle()

        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isFavorite ? .yellow : .gray)
        }
    }

    private func changeStateOfFavorite() {
        if !isFavorite {
            modelData.favoriteRestaurants.append(property)
            print("좋아하는 식당 리스트입니다 \(modelData.favoriteRestaurants.count)")
        } else {
            guard let propertyIndex = modelData.favoriteRestaurants.firstIndex(where: {$0.id.number == property.id.number}) else { return }
            modelData.favoriteRestaurants.remove(at: propertyIndex)
        }
    }
}
