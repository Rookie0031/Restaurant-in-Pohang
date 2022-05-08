//
//  ImageModifier.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI

// 1. customImage detail
struct ImageModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 250, alignment: .center)
            .cornerRadius(25)
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
    func customImageInfo() -> some View {
        modifier(ImageModifier2())
    }
}

// 3. ImageSizeModifer3
struct ImageModifier3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 160, height: 160)
            .cornerRadius(10)
    }
}

extension View {
    func customImageList() -> some View {
        modifier(ImageModifier3())
    }
}


// 4. OneGridModifer
struct ImageModifier4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 310, height: 225)
            .cornerRadius(17)
    }
}

extension View {
    func customImageLazyOneCol() -> some View {
        modifier(ImageModifier4())
    }
}

