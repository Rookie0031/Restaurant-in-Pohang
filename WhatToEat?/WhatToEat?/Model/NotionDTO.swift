// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let test = try? JSONDecoder().decode(Test.self, from: jsonData)

import Foundation

// MARK: - Test
struct NotionDTO: Codable, Hashable, Equatable {
    let object: String
    let results: [ResultInfo]
    let nextCursor: JSONNull?
    let hasMore: Bool
    let type: String
    let pageOrDatabase: PageOrDatabase
    let developerSurvey: String?

    enum CodingKeys: String, CodingKey {
        case object, results
        case nextCursor = "next_cursor"
        case hasMore = "has_more"
        case type
        case pageOrDatabase = "page_or_database"
        case developerSurvey = "developer_survey"
    }
}

// MARK: - PageOrDatabase
struct PageOrDatabase: Codable, Hashable, Equatable {
}

// MARK: - Result
struct ResultInfo: Codable, Hashable, Equatable {
    let object, id, createdTime, lastEditedTime: String
    let createdBy, lastEditedBy: TedBy
    let cover, icon: JSONNull?
    let parent: Parent
    let archived: Bool
    let properties: Properties
    let url, publicURL: String

    enum CodingKeys: String, CodingKey {
        case object, id
        case createdTime = "created_time"
        case lastEditedTime = "last_edited_time"
        case createdBy = "created_by"
        case lastEditedBy = "last_edited_by"
        case cover, icon, parent, archived, properties, url
        case publicURL = "public_url"
    }
}

// MARK: - TedBy
struct TedBy: Codable, Hashable, Equatable {
    let object: Object
    let id: String
}

enum Object: String, Codable, Hashable, Equatable {
    case user = "user"
}

// MARK: - Parent
struct Parent: Codable, Hashable, Equatable {
    let type, databaseID: String

    enum CodingKeys: String, CodingKey {
        case type
        case databaseID = "database_id"
    }
}

// MARK: - Properties
struct Properties: Codable, Hashable, Equatable {
    let favorite: Favorite
    let imageFile: ImageFile
    let id: IDClass
    let description: Description
    let transportation: People
    let location, imageName: Description
    let category, price: Category
    let people: People
    let name: Name
}

// MARK: - Category
struct Category: Codable, Hashable, Equatable {
    let id: CategoryID
    let type: CategoryType
    let select: Select
}

enum CategoryID: String, Codable, Hashable, Equatable {
    case the5DEw = "%5D_ew"
    case zefO = "ZefO"
}

// MARK: - Select
struct Select: Codable, Hashable, Equatable {
    let id, name, color: String
}

enum CategoryType: String, Codable, Hashable, Equatable {
    case select = "select"
}

// MARK: - Description
struct Description: Codable, Hashable, Equatable {
    let id: DescriptionID
    let type: DescriptionType
    let richText: [RichText]

    enum CodingKeys: String, CodingKey {
        case id, type
        case richText = "rich_text"
    }
}

enum DescriptionID: String, Codable, Hashable, Equatable {
    case dmVK = "DmVK"
    case n605C40 = "N%60%5C%40"
    case wAH = "W_aH"
}

// MARK: - RichText
struct RichText: Codable, Hashable, Equatable {
    let type: RichTextType
    let text: TextInfo
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
struct Annotations: Codable, Hashable, Equatable {
    let bold, italic, strikethrough, underline: Bool
    let code: Bool
    let color: ColorInfo
}

enum ColorInfo: String, Codable, Hashable, Equatable {
    case colorDefault = "default"
}

// MARK: - Text
struct TextInfo: Codable, Hashable, Equatable {
    let content: String
    let link: JSONNull?
}

enum RichTextType: String, Codable, Hashable, Equatable {
    case text = "text"
}

enum DescriptionType: String, Codable, Hashable, Equatable {
    case richText = "rich_text"
}

// MARK: - Favorite
struct Favorite: Codable, Hashable, Equatable {
    let id, type: String
    let checkbox: Bool
}

// MARK: - IDClass
struct IDClass: Codable, Hashable, Equatable {
    let id, type: String
    let number: Int
}

// MARK: - ImageFile
struct ImageFile: Codable, Hashable, Equatable {
    let id, type: String
    let files: [FileElement]
}

// MARK: - FileElement
struct FileElement: Codable, Hashable, Equatable {
    let name, type: String
    let file: FileFile
}

// MARK: - FileFile
struct FileFile: Codable, Hashable, Equatable {
    let url: String
    let expiryTime: String

    enum CodingKeys: String, CodingKey {
        case url
        case expiryTime = "expiry_time"
    }
}

// MARK: - Name
struct Name: Codable, Hashable, Equatable {
    let id, type: String
    let title: [RichText]
}

// MARK: - People
struct People: Codable, Hashable, Equatable {
    let id: PeopleID
    let type: PeopleType
    let multiSelect: [Select]

    enum CodingKeys: String, CodingKey {
        case id, type
        case multiSelect = "multi_select"
    }
}

enum PeopleID: String, Codable, Hashable, Equatable {
    case k7BYq = "K%7BYq"
    case xdko = "xdko"
}

enum PeopleType: String, Codable, Hashable, Equatable {
    case multiSelect = "multi_select"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable, Equatable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
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
