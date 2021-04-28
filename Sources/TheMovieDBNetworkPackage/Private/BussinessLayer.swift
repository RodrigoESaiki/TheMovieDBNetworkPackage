//
//  BussinessLayer.swift
//  TheMovieNetworkingFramework
//
//  Created by rodrigo.eidi.saiki on 13/04/21.
//
import Foundation

final class BussinessLayer: Requests {
    
    private let service = ServiceLayer()
    
    // MARK: Popular Movies
    func getPopularMovies(completion: @escaping (Result<[MovieResponse], Error>) -> ()) {
        service.request(router: .popularMovies) { result in
            switch result {
            case let .success(data):
                self.successRequest(data: data, completion: completion)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    private func successRequest(data: Data, completion: @escaping (Result<[MovieResponse], Error>) -> ()) {
        do {
            let responseObject = try JSONDecoder().decode(RequestResponse.self, from: data)
            let movieResponse: [MovieResponse] = responseObject.results
            completion(.success(movieResponse))
        } catch {
            return completion(.failure(error))
        }
    }
    
    // MARK: Posters
    func getPosters(path: String, completion: @escaping (Result<Data, Error>) -> ()) {
        let router = RouterRequestModel.posters(posterPath: path)
        service.request(router: router) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
