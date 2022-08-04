//
//  ColorData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/04.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension Color {
    static let primaryBlack : Color = Color(hex: "252525")
    static let subBlack :Color = Color(hex: "353535")
    static let detailBlack : Color = Color(hex: "434343")
    static let lightOrange :Color = Color(hex: "#FF994A")
    public static let lightGray : Color = Color(hex: "#F2F2F7")

}
