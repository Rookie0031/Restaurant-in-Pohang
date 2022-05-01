//
//  ImageModifier.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI

// 1. ImageSizeModifer
struct ImageModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 300, alignment: .center)
            .cornerRadius(10)
    }
}

extension View {
    func customImageDetail() -> some View {
        modifier(ImageModifier1())
    }
}


// 2. ImageSizeModifer2
struct ImageModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 300)
            .cornerRadius(10)
    }
}

extension View {
    func customImageList() -> some View {
        modifier(ImageModifier2())
    }
}
