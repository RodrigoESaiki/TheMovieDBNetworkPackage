//
//  RouterRequestModel.swift
//  TheMovieNetworkingFramework
//
//  Created by rodrigo.eidi.saiki on 13/04/21.
//
import Foundation

enum RouterRequestModel {
    
    case popularMovies
    case posters(posterPath: String)
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        switch self {
        case .popularMovies:
            return "api.themoviedb.org"
        case .posters:
            return "image.tmdb.org"
        }
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case let .posters(path):
            return "/t/p/w500/\(path)"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .popularMovies:
            return [URLQueryItem(name: "api_key", value: "1c6306e8adac62a4c6999722409aadf8"),
                    URLQueryItem(name: "language", value: "en"),
                    URLQueryItem(name: "page", value: "1")]
        case .posters:
            return nil
        }
    }
    
}
