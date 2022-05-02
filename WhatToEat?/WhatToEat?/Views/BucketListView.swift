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
            
        List{
            NavigationLink(destination: InformationView()){
                InformationRowView(restaurant: restaurants[0])}
            NavigationLink(destination: InformationView()){
                InformationRowView(restaurant: restaurants[0])}
            NavigationLink(destination: InformationView()){
                InformationRowView(restaurant: restaurants[0])}
            
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
