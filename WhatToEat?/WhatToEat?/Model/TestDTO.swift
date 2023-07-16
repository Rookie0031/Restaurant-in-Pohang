//
//  TestDTO.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/07/17.
//


import Foundation

// MARK: - Test
struct Test: Codable, Equatable, Hashable {
    let object: String
    let results: [ResultInfo]
    let nextCursor: JSONNull?
    let hasMore: Bool
    let type: String
    let pageOrDatabase: PageOrDatabase
    let developerSurvey: String

    enum CodingKeys: String, CodingKey {
        case object, results
        case nextCursor
        case hasMore
        case type
        case pageOrDatabase
        case developerSurvey
    }
}

// MARK: - PageOrDatabase
struct PageOrDatabase: Codable, Equatable, Hashable {
}

// MARK: - Result
struct ResultInfo: Codable, Equatable, Hashable {
    let object, id, createdTime, lastEditedTime: String
    let createdBy, lastEditedBy: TedBy
    let cover, icon: JSONNull?
    let parent: Parent
    let archived: Bool
    let properties: Properties
    let url, publicURL: String

    enum CodingKeys: String, CodingKey {
        case object, id
        case createdTime
        case lastEditedTime
        case createdBy
        case lastEditedBy
        case cover, icon, parent, archived, properties, url
        case publicURL
    }
}

// MARK: - TedBy
struct TedBy: Codable, Equatable, Hashable {
    let object, id: String
}

// MARK: - Parent
struct Parent: Codable, Equatable, Hashable {
    let type, databaseID: String

    enum CodingKeys: String, CodingKey {
        case type
        case databaseID
    }
}

// MARK: - Properties
struct Properties: Codable, Equatable, Hashable {
    let favorite: Favorite
    let imageFile: ImageFile
    let id: ID
    let propertiesDescription: Description
    let transportation: People
    let location, imageName: Description
    let category, price: Category
    let people: People
    let name: Name
}

// MARK: - Category
struct Category: Codable, Equatable, Hashable {
    let id, type: String
    let select: Select
}

// MARK: - Select
struct Select: Codable, Equatable, Hashable {
    let id, name, color: String
}

// MARK: - Description
struct Description: Codable, Equatable, Hashable {
    let id, type: String
    let richText: [RichText]

    enum CodingKeys: String, CodingKey {
        case id, type
        case richText
    }
}

// MARK: - RichText
struct RichText: Codable, Equatable, Hashable {
    let type: String
    let text: TextInfo
    let annotations: Annotations
    let plainText: String
    let href: JSONNull?

    enum CodingKeys: String, CodingKey {
        case type, text, annotations
        case plainText
        case href
    }
}

// MARK: - Annotations
struct Annotations: Codable, Equatable, Hashable {
    let bold, italic, strikethrough, underline: Bool
    let code: Bool
    let color: String
}

// MARK: - Text
struct TextInfo: Codable, Equatable, Hashable {
    let content: String
    let link: JSONNull?
}

// MARK: - Favorite
struct Favorite: Codable, Equatable, Hashable {
    let id, type: String
    let checkbox: Bool
}

// MARK: - ID
struct ID: Codable, Equatable, Hashable {
    let id, type: String
    let number: Int
}

// MARK: - ImageFile
struct ImageFile: Codable, Equatable, Hashable {
    let id, type: String
    let files: [FileElement]
}

// MARK: - FileElement
struct FileElement: Codable, Equatable, Hashable {
    let name, type: String
    let file: FileFile
}

// MARK: - FileFile
struct FileFile: Codable, Equatable, Hashable {
    let url: String
    let expiryTime: String

    enum CodingKeys: String, CodingKey {
        case url
        case expiryTime
    }
}

// MARK: - Name
struct Name: Codable, Equatable, Hashable {
    let id, type: String
    let title: [RichText]
}

// MARK: - People
struct People: Codable, Equatable, Hashable {
    let id, type: String
    let multiSelect: [Select]

    enum CodingKeys: String, CodingKey {
        case id, type
        case multiSelect
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Equatable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
