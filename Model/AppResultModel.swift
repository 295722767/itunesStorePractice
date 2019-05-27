//
//  AppResultModel.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/14/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}
 
struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let id: String
}


struct promotionObject: Decodable {
    let id, name, imageUrl, tagline: String
}

