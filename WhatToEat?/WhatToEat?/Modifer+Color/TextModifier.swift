//
//  ExtensionData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI


// 1. customTitle
struct TextModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25).weight(.medium))
            .foregroundColor(.primaryBlack)
    }
}

extension View {
    func customTitle() -> some View {
        modifier(TextModifier1())
    }
}


// 2. customInfoTitle
struct TextModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.heavy))
            .foregroundColor(.primaryBlack)
    }
}

extension View {
    func customInfoTitle() -> some View {
        modifier(TextModifier2())
    }
}


// 3. customInfoSubTitle
struct TextModifier3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.bold))
//            .foregroundColor(.subBlack)
    }
}

extension View {
    func customInfoSubTitle() -> some View {
        modifier(TextModifier3())
    }
}


// 4. customInfoContent
struct TextModifier4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14).weight(.medium))
            .foregroundColor(.detailBlack)
    }
}

extension View {
    func customInfoContent1() -> some View {
        modifier(TextModifier4())
    }
}

// 5. customInfoContent2
struct TextModifier5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.regular))
            .foregroundColor(.subBlack)
    }
}

extension View {
    func customInfoContent2() -> some View {
        modifier(TextModifier5())
    }
}

// 5. customInfoContent2 + button text
struct TextModifier6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.heavy))
//            .foregroundColor(.subBlack)
    }
}

extension View {
    func customButtonText() -> some View {
        modifier(TextModifier6())
    }
}

// 6. FoodDescription
struct TextModifier7: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.bold))
            .foregroundColor(.subBlack)
    }
}

extension View {
    func descriptionTextStyle() -> some View {
        modifier(TextModifier7())
    }
}




