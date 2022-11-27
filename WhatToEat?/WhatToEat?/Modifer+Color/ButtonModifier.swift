//
//  ButtonFormat.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//


import Foundation
import SwiftUI

// 1. custom button format
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .customButtonText()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.065, alignment: .center)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(UIScreen.main.bounds.width * 0.05)
    }
}

extension View {
    func customButtonFormat() -> some View {
        modifier(ButtonModifier())
    }
}

struct CategoryModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .customInfoSubTitle()
            .padding(EdgeInsets(.init(top:10, leading: 10, bottom: 10, trailing: 10)))
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 0))
    }
}

extension View {
    func customCategory() -> some View {
        modifier(CategoryModifier())
    }
}



