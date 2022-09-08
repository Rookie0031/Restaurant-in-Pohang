//
//  NotionDataDTO.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/05.
//

import Foundation

// MARK: - ExampleDTO
struct ExampleDTO: Codable, Equatable {
    let object: String
    let results: [Result]
    let nextCursor: JSONNull?
    let hasMore: Bool
    let type: ObjectEnum
    let page: Page

    enum CodingKeys: String, CodingKey {
        case object, results
        case nextCursor = "next_cursor"
        case hasMore = "has_more"
        case type, page
    }
}

// MARK: - Page
struct Page: Codable, Equatable {
}

// MARK: - Result
struct Result: Codable, Equatable {
    let object: ObjectEnum
    let id: String
    let createdTime, lastEditedTime: TedTime
    let createdBy, lastEditedBy: TedBy
    let cover, icon: JSONNull?
    let parent: Parent
    let archived: Bool
    let properties: Properties
    let url: String

    enum CodingKeys: String, CodingKey {
        case object, id
        case createdTime = "created_time"
        case lastEditedTime = "last_edited_time"
        case createdBy = "created_by"
        case lastEditedBy = "last_edited_by"
        case cover, icon, parent, archived, properties, url
    }
}

// MARK: - TedBy
struct TedBy: Codable, Equatable {
    let object: Object
    let id: String
}

enum Object: String, Codable, Equatable {
    case user = "user"
}

enum TedTime: String, Codable, Equatable {
    case the20220823T143700000Z = "2022-08-23T14:37:00.000Z"
    case the20220904T135800000Z = "2022-09-04T13:58:00.000Z"
    case the20220904T221900000Z = "2022-09-04T22:19:00.000Z"
    case the20220905T001400000Z = "2022-09-05T00:14:00.000Z"
}

enum ObjectEnum: String, Codable, Equatable {
    case page = "page"
}

// MARK: - Parent
struct Parent: Codable, Equatable {
    let type: ParentType
    let databaseID: String

    enum CodingKeys: String, CodingKey {
        case type
        case databaseID = "database_id"
    }
}

enum ParentType: String, Codable, Equatable {
    case databaseID = "database_id"
}

// MARK: - Properties
struct Properties: Codable, Equatable {
    let id: IDClass
    let propertiesDescription: Description
    let transportation: People
    let location, imageName: Description
    let category, price: Category
    let people: People
    let name: Name
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case propertiesDescription = "description"
        case transportation, location, imageName, category, price, people, name
    }
}

// MARK: - Category
struct Category: Codable, Equatable {
    let id: CategoryID
    let type: CategoryType
    let select: Select
}

enum CategoryID: String, Codable, Equatable {
    case the5DEw = "%5D_ew"
    case zefO = "ZefO"
}

// MARK: - Select
struct Select: Codable, Equatable {
    let id, name: String
    let color: SelectColor
}

enum SelectColor: String, Codable, Equatable {
    case blue = "blue"
    case gray = "gray"
    case green = "green"
    case orange = "orange"
    case pink = "pink"
    case purple = "purple"
    case red = "red"
    case yellow = "yellow"
}

enum CategoryType: String, Codable, Equatable {
    case select = "select"
}

// MARK: - IDClass
struct IDClass: Codable, Equatable {
    let id: IDID
    let type: IDType
    let number: Int
}

enum IDID: String, Codable, Equatable {
    case dQp5D = "DQp%5D"
}

enum IDType: String, Codable, Equatable {
    case number = "number"
}

// MARK: - Description
struct Description: Codable, Equatable {
    let id: DescriptionID
    let type: DescriptionType
    let richText: [RichText]

    enum CodingKeys: String, CodingKey {
        case id, type
        case richText = "rich_text"
    }
}

enum DescriptionID: String, Codable, Equatable {
    case dmVK = "DmVK"
    case n605C40 = "N%60%5C%40"
    case wAH = "W_aH"
}

// MARK: - RichText
struct RichText: Codable, Equatable {
    let type: RichTextType
    let text: TextInformation
    let annotations: Annotations
    let plainText: String
    let href: JSONNull?

    enum CodingKeys: String, CodingKey {
        case type, text, annotations
        case plainText = "plain_text"
        case href
    }
}

// MARK: - Annotations
struct Annotations: Codable, Equatable {
    let bold, italic, strikethrough, underline: Bool
    let code: Bool
    let color: AnnotationsColor
}

enum AnnotationsColor: String, Codable, Equatable {
    case colorDefault = "default"
}

// MARK: - Text
struct TextInformation: Codable, Equatable {
    let content: String
    let link: JSONNull?
}

enum RichTextType: String, Codable, Equatable {
    case text = "text"
}

enum DescriptionType: String, Codable, Equatable {
    case richText = "rich_text"
}

// MARK: - Name
struct Name: Codable, Equatable {
    let id, type: TypeEnum
    let title: [RichText]
}

enum TypeEnum: String, Codable, Equatable {
    case title = "title"
}

// MARK: - People
struct People: Codable, Equatable {
    let id: PeopleID
    let type: PeopleType
    let multiSelect: [Select]

    enum CodingKeys: String, CodingKey {
        case id, type
        case multiSelect = "multi_select"
    }
}

enum PeopleID: String, Codable, Equatable {
    case k7BYq = "K%7BYq"
    case xdko = "xdko"
}

enum PeopleType: String, Codable, Equatable {
    case multiSelect = "multi_select"
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
