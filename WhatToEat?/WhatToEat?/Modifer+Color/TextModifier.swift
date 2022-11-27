//
//  ExtensionData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI


// 1. customTitle
struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25).weight(.black))
            .foregroundColor(.primaryBlack)
    }
}

extension View {
    func customTitle() -> some View {
        modifier(TitleTextModifier())
    }
}


// 2. customInfoTitle
struct SubTitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.heavy))
            .foregroundColor(.primaryBlack)
    }
}

extension View {
    func customInfoTitle() -> some View {
        modifier(SubTitleTextModifier())
    }
}


// 3. customInfoSubTitle
struct CalloutTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.bold))
//            .foregroundColor(.subBlack)
    }
}

extension View {
    func customInfoSubTitle() -> some View {
        modifier(CalloutTextModifier())
    }
}


// 4. customInfoContent
struct FootnoteTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14).weight(.medium))
            .foregroundColor(.detailBlack)
    }
}

extension View {
    func customInfoContent1() -> some View {
        modifier(FootnoteTextModifier())
    }
}

// 5. customInfoContent2
struct HeadLineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.regular))
            .foregroundColor(.subBlack)
    }
}

extension View {
    func customInfoContent2() -> some View {
        modifier(HeadLineTextModifier())
    }
}

// bbutton text
struct SecondCalloutTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.heavy))
    }
}

extension View {
    func customButtonText() -> some View {
        modifier(SecondCalloutTextModifier())
    }
}

// 6. FoodDescription
struct FoodDescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.bold))
            .foregroundColor(.subBlack)
    }
}

extension View {
    func descriptionTextStyle() -> some View {
        modifier(FoodDescriptionTextModifier())
    }
}




