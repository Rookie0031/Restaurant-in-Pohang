//
//  ModelData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import Foundation
import SwiftUI


// import jason Data

var restaurants : [RestaurantData] = load("restaurantData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


// Filter food category from jason Data


func foodFilter () -> [[String]] {
    
    var western : [String] = []
    var korean : [String] = []
    var chinese : [String] = []
    var japanese : [String] = []
    var asian : [String] = []
    var cafe : [String] = []
    
    for num in 0...restaurants.count - 1 {
        
        
        switch restaurants[num].category {
        case "양식" :
            western.append(restaurants[num].name)

        case "한식" :
            korean.append(restaurants[num].name)

        case "중식" :
            chinese.append(restaurants[num].name)

        case "일식" :
            japanese.append(restaurants[num].name)

        case "아시안" :
            asian.append(restaurants[num].name)

        case "카페/디저트" :
            cafe.append(restaurants[num].name)
            
        default :
            print("정보에 오류가 있는 거 같아요.")
            
        }

    }
    
    return [korean, western, chinese, japanese, asian, cafe]

}

