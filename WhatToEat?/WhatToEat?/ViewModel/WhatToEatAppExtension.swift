//
//  WhatToEatAppExtension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/30.
//

extension WhatToEatApp {
    func setFoodCategory() {
        var western : [Properties] = []
        var korean : [Properties] = []
        var chinese : [Properties] = []
        var japanese : [Properties] = []
        var asian : [Properties] = []
        var cafe : [Properties] = []

        for data in rootModelData.localData {

            switch data.category.select.name {
            case "양식" :
                western.append(data)
            case "한식" :
                korean.append(data)
            case "중식" :
                chinese.append(data)
            case "일식" :
                japanese.append(data)
            case "기타" :
                asian.append(data)
            case "카페/디저트" :
                cafe.append(data)
            default :
                print("정보에 오류가 있는 거 같아요.")
            }
        }

        if !rootModelData.localData.isEmpty {
            rootModelData.foodCategoryFiltered.append(western)
            rootModelData.foodCategoryFiltered.append(korean)
            rootModelData.foodCategoryFiltered.append(chinese)
            rootModelData.foodCategoryFiltered.append(japanese)
            rootModelData.foodCategoryFiltered.append(cafe)
        }
    }
}
