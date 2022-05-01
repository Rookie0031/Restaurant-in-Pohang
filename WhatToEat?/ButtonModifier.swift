//
//  ButtonFormat.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//


import Foundation
import SwiftUI

// 1. ImageSizeModifer
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .customButtonText()
            .padding(.leading, 10)
            .frame(width: 300, height: 40, alignment: .leading)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(10)
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
            .font(.system(size: 30))
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(.orange, lineWidth: 3))
    }
}

extension View {
    func customCategoryFormat() -> some View {
        modifier(CategoryModifier())
    }
}

