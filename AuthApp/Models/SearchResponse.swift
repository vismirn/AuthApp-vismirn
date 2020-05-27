//
//  SearchResponse.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 10.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
    
    

}

struct Track: Decodable {
    var trackName: String
    var artistName: String
    var collectionName: String
    var artworkUrl60: String?
    var previewUrl: String?
}
