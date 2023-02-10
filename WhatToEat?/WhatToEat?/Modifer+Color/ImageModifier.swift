//
//  ImageModifier.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//
import SwiftUI

struct ImageModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 250, alignment: .center)
            .cornerRadius(25)
    }
}

extension View {
    func customImageDetail() -> some View {
        modifier(ImageModifer())
    }
}
