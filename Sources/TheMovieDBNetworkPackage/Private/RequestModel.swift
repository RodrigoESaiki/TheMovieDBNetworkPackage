//
//  RequestModel.swift
//  TheMovieNetworkingFramework
//
//  Created by rodrigo.eidi.saiki on 13/04/21.
//

import Foundation

struct RequestResponse: Codable {
    let page: Int
    let results: [MovieResponse]
}

public struct MovieResponse: Codable {
    public let originalTitle: String
    public let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
}
