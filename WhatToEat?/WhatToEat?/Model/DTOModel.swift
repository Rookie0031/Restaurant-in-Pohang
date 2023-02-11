//
//  DTOClass.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//

import Foundation

final class DTOModel {
    static func generatejsonDocument(databaseID: String, description : String, location: String, price: String, people: String, category: String, name: String, imageData: String) -> Data {
        
        let pureJson = """
            {
            "parent": {
            "database_id": "\(databaseID)"
            },
            "properties": {
            "transportation": {
                "id": "C",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(imageData)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "nothing",
                        "href": null
                    }
                ]
            },
            "review": {
                "id": "VmW~",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(description)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "dasdsad",
                        "href": null
                    }
                ]
            },
            "imageFile": {
                "id": "%5EU_%7C",
                "type": "files",
                "files": [
                    {
                        "name": "스크린샷 2022-10-24 오전 1.32.14.png",
                        "type": "file",
                        "file": {
                            "url": \(imageData),
                            "expiry_time": "2022-11-27T14:38:42.729Z"
                        }
                    }
                ]
            },
            "location": {
                "id": "cy%3FJ",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(location)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(location)",
                        "href": null
                    }
                ]
            },
            "price": {
                "id": "jzKd",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(price)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(price)",
                        "href": null
                    }
                ]
            },
            "people": {
                "id": "mYY%60",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(people)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(people)",
                        "href": null
                    }
                ]
            },
            "description": {
                "id": "sbWV",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "adasd",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(description)",
                        "href": null
                    }
                ]
            },
            "category": {
                "id": "%7BstL",
                "type": "rich_text",
                "rich_text": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(category)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(category)",
                        "href": null
                    }
                ]
            },
            "Name": {
                "id": "title",
                "type": "title",
                "title": [
                    {
                        "type": "text",
                        "text": {
                            "content": "\(name)",
                            "link": null
                        },
                        "annotations": {
                            "bold": false,
                            "italic": false,
                            "strikethrough": false,
                            "underline": false,
                            "code": false,
                            "color": "default"
                        },
                        "plain_text": "\(name)",
                        "href": null
                    }
                ]
            }
            }
            }
            """
        
        return pureJson.data(using: .utf8) ?? Data()

    }
}
