//
//  RequestProvider.swift
//  TheMovieNetworkingFramework
//
//  Created by rodrigo.eidi.saiki on 13/04/21.
//
import Foundation

final class ServiceLayer {
    
    func request(router: RouterRequestModel, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = createUrl(router: router) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                return completion(.failure(error))
            }
            guard urlResponse != nil, let data = data else { return }
            completion(.success(data))
        }
        task.resume()
    }
            
    private func createUrl(router: RouterRequestModel) -> URL? {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        return components.url
    }
}
