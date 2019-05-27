//
//  ReviewModel.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/24/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import Foundation
struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    
    let rating: Label

    //custom coding key
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label

}
struct Label: Decodable {
    let label: String
}


