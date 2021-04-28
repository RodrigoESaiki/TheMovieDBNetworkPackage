//
//  Request.swift
//  TheMovieNetworkingFramework
//
//  Created by rodrigo.eidi.saiki on 13/04/21.
//

import Foundation

 public protocol Requests {
    func getPopularMovies(completion: @escaping (Result<[MovieResponse], Error>) -> ())
    func getPosters(path: String, completion: @escaping (Result<Data, Error>) -> ())
}

public final class Request: Requests {
    
    private let bussinessLayer = BussinessLayer()

    public init() {}

    public func getPopularMovies(completion: @escaping (Result<[MovieResponse], Error>) -> ()) {
        bussinessLayer.getPopularMovies { result in
            switch result {
            case let .success(movies):
                print(movies[0].originalTitle)
                completion(.success(movies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    public func getPosters(path: String, completion: @escaping (Result<Data, Error>) -> ()) {
        bussinessLayer.getPosters(path: path) { result in
            switch result {
            case let .success(poster):
                completion(.success(poster))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
