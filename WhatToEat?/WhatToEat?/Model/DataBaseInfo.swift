//
//  DataBaseInfo.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/11/27.
//

import Foundation

final class DataBaseInfo {
    
    static let token = "secret_Wr03qVPMmjssmtYi8vEHc7zmWnG6PO5AjtoZG7QVkpB"

    static let databaseID = "206c4793c7e6428eb8235279a3e445af"

    static let readURL = "https://api.notion.com/v1/databases/\(databaseID)/query"
    
    static let headers = [
        "Authorization": "Bearer " + token,
        "Notion-Version": "2022-06-28"
    ]
}
