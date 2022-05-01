//
//  CategroyScroll.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//




//import SwiftUI
//
//struct CategoryScrollView: View {
//    @State var currentIndex: Int
//    var caseCategory : [String]
//    
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(caseCategory, id: \.self) { value in
//                    Button(action: {
//                        currentIndex = caseCategory.firstIndex(of: value)!
//                    }) {
//                        caseCategory.firstIndex(of: value)! == currentIndex ?
//                        
//                        Text(value)
//                            .customCategoryFormat()
//                            .foregroundColor(.white)
//                            .background(RoundedRectangle(cornerRadius: 30).fill(.blue))
//                        :
//                        Text(value)
//                            .customCategoryFormat()
//                            .foregroundColor(.blue)
//                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
//                    }
//                        .padding(EdgeInsets(.init(top: 5, leading: 10, bottom: 5, trailing: 10)))
//                }
//            }
//        }
//    }
//}
