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
            changeStateOfFavorite()
            property.isFavorite.toggle()

        } label: {
            Label("Toggle Favorite", systemImage: property.isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(property.isFavorite ? .yellow : .gray)
        }
    }

    private func changeStateOfFavorite() {
        if !property.isFavorite {
            modelData.localData.append(property)
            print("좋아하는 식당 리스트입니다 \(modelData.localData.count)")
        } else {
            guard let propertyIndex = modelData.localData.firstIndex(where: {$0.id.number == property.id.number}) else { return }
            modelData.localData.remove(at: propertyIndex)
            print("좋아하는 식당 리스트입니다 \(modelData.localData.count)")
        }
    }
}
