//
//  FoodInfoViewReco.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//
import Kingfisher
import SwiftUI

struct RestaurantInfoView: View {

    @Environment(\.dismiss) private var dismiss
    @State var foodInformation : Properties

    var foodInformationIndex: Int {
        return 0
    }

    var propertyIndex: Int {
        return 0
    }

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.orange.opacity(0.07))
                .cornerRadius(20)

            VStack {
                FoodTitleAndImage()
                FoodDescription()
                Spacer()
            }
            .padding(.top, 40)
        }
        .padding()
    }
}
