//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/7/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation

// json decodable project

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    var screenshotUrls: [String]?
    var formattedPrice: String?
    var description: String?
    var releaseNotes: String?
    var artistName: String?
    var collectionName: String?
}
