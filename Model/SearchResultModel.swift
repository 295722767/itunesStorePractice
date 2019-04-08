//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/7/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation

// json decodable project
struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
}

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
