//
//  ExtensionData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//
import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25).weight(.black))
            .foregroundColor(.primaryBlack)
    }
}

struct SubTitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.heavy))
            .foregroundColor(.primaryBlack)
    }
}

struct CalloutTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.bold))
    }
}

struct FootnoteTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14).weight(.medium))
            .foregroundColor(.detailBlack)
    }
}

struct HeadLineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.regular))
            .foregroundColor(.subBlack)
    }
}

struct SecondCalloutTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16).weight(.heavy))
    }
}

struct FoodDescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.bold))
            .foregroundColor(.subBlack)
    }
}

extension View {
    func customTitle() -> some View { modifier(TitleTextModifier()) }

    func customInfoTitle() -> some View { modifier(SubTitleTextModifier()) }
    
    func customInfoSubTitle() -> some View { modifier(CalloutTextModifier()) }
    
    func customInfoContent1() -> some View { modifier(FootnoteTextModifier()) }
    
    func customInfoContent2() -> some View { modifier(HeadLineTextModifier()) }
    
    func customButtonText() -> some View { modifier(SecondCalloutTextModifier()) }

    func descriptionTextStyle() -> some View { modifier(FoodDescriptionTextModifier()) }
}




