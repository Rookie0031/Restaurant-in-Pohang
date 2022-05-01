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
            .frame(width: 300, height: 40, alignment: .center)
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

//struct CategoryModifier2: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .customInfoSubTitle()
//            .padding(EdgeInsets(.init(top:10, leading: 10, bottom: 10, trailing: 10)))
//            .overlay(RoundedRectangle(cornerRadius: 10)
//                .stroke(.black, lineWidth: 3))
//    }
//}
//
//extension View {
//    func customCategoryPicked() -> some View {
//        modifier(CategoryModifier2())
//    }
//}



