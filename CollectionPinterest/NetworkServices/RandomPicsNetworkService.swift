//
//  RandomPicsNetworkService.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 15.11.2024.
//

import Foundation

final class RandomPicsNetworkService {
    
    private let accessKeys = [
        "dUlcYLyaqcDv1aiOtQ1JBUwGaV3ref8UJDoMYr0RRco",
        "g_s0OZjK78m-PdfzUXE4OPisuyCa7VMwlyMVsSDkH6o",
        "W8Po5OseDe22EiSohwt94McbzljhM-6VdXZ8IzQBrfg"
    ]
    
    func requestPics(completion: @escaping (Data?, Error?) -> Void) {
        let url = makeUrl()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Authorization":"Client-ID \(accessKeys[1])"]
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func makeUrl() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = [URLQueryItem(name: "count", value: "10")]
        guard let result = components.url else {return URL(string: "https://api.unsplash.com//photos/random")!}
        return result
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
