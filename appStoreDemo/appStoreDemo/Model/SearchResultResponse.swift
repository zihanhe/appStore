//
//  SearchResultResponse.swift
//  appStoreDemo
//
//  Created by thunder on 29/03/21.
//

import Foundation

struct SearchResultResponse: Codable {
    let resultCount: Int
    let results: [ResultItem]
}

struct ResultItem: Codable {
    let trackName: String
    let primaryGenreName: String
    let artworkUrl100: String?
    var averageUserRating: Float?
    let screenshotUrls: [String]
}
