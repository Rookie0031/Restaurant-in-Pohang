//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    let pageId: String
    @ObservedObject var vm: FoodListVM
    @State private var isFavorite: Bool = false

    var body: some View {
        Button {
            changeFavoriteState()
            print(favoriteFoods)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isFavorite ? .pink : .gray)
        }
        .onAppear {
            isFavorite = favoriteFoods.contains(pageId)
        }
    }

    private func changeFavoriteState() {
        if favoriteFoods.contains(pageId) {
            print("Favorite Data Store")
            guard let index = favoriteFoods.firstIndex(of: pageId) else { return }
            favoriteFoods.remove(at: index)

        } else {
            favoriteFoods.append(pageId)
        }

        isFavorite.toggle()

        if let encodedData = try? JSONEncoder().encode(favoriteFoods) {
            print("Favorite Data Store")
            UserDefaults.standard.set(encodedData, forKey: "MyFavorites")
        }
    }
}
