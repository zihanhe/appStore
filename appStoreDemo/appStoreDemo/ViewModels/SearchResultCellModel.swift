//
//  SearchResultCellModel.swift
//  appStoreDemo
//
//  Created by thunder on 28/03/21.
//

import Foundation
struct SearchResultCellModel {
    let artworkUrl100: URL?
    
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    
    let screenshotUrls: [URL]

}
