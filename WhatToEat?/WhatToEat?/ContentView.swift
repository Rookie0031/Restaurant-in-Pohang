//
//  ContentView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            Text("Hello, world!")
//                .padding()
            
            InformationView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
