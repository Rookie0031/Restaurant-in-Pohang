//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct BucketListView: View {
    var body: some View {
        
        NavigationView{
            
            List(restaurants, id: \.id) {restaurant in
                InformationRowView(restaurant: restaurant)
            }
            .navigationTitle("나의 먹킷리스트")
            
            }
        }
    }

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
