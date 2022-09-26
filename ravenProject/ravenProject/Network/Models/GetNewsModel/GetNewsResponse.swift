//
//  GetNewsResponse.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation

// MARK: - GetNewsResponse
struct GetNewsResponse: Codable {
    var hits: [Hit]
    var nbHits : Int?
    var page : Int?
    var nbPages : Int?
    var hitsPerPage: Int?
    var exhaustiveNbHits: Bool?
    var exhaustiveTypo: Bool?
    var exhaustive: Exhaustive?
    var query: Query?
    var params: String?
    var processingTimeMS: Int?
    var processingTimingsMS: ProcessingTimingsMS?
}

// MARK: - Exhaustive
struct Exhaustive: Codable {
    var nbHits, typo: Bool
}

// MARK: - Hit
struct Hit: Codable {
    var createdAt: String?
    var title: String?
    var url: String?
    var author: String?
    var points: Int?
    var storyText : String?
    var commentText: String?
    var numComments : Int?
    var storyID: Int?
    var storyTitle: String?
    var storyURL: String?
    var parentID: Int?
    var createdAtI: Int?
    var tags: [String]?
    var objectID: String
    var highlightResult: HighlightResult?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
        case storyID = "story_id"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAtI = "created_at_i"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
}

// MARK: - HighlightResult
struct HighlightResult: Codable {
    var author: Author?
    var commentText: Author?
    var storyTitle: Author?
    var storyURL: Author?
    var title: Author?
    var storyText: Author?
    var url: Author?

    enum CodingKeys: String, CodingKey {
        case author
        case commentText = "comment_text"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case title
        case storyText = "story_text"
        case url
    }
}

// MARK: - Author
struct Author: Codable {
    var value: String?
    var matchLevel: MatchLevel?
    var matchedWords: [Query]?
    var fullyHighlighted: Bool?
}

enum MatchLevel: String, Codable {
    case full = "full"
    case none = "none"
}

enum Query: String, Codable {
    case mobile = "mobile"
}

// MARK: - ProcessingTimingsMS
struct ProcessingTimingsMS: Codable {
    var afterFetch: AfterFetch?
    var fetch: Fetch?
    var total: Int?
}

// MARK: - AfterFetch
struct AfterFetch: Codable {
    var format: Format?
    var total: Int?
}

// MARK: - Format
struct Format: Codable {
    var highlighting: Int?
    var total: Int?
}

// MARK: - Fetch
struct Fetch: Codable {
    var total: Int?
}
