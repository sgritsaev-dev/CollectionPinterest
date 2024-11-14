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
        //спросить зачем нужен escaping и почему без него не работает
        // спросить про completion простыми словами
        let url = makeUrl()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Authorization":"Client-ID \(accessKeys[0])"]
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func makeUrl() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = [URLQueryItem(name: "count", value: "1")]
        guard let result = components.url else {return URL(string: "https://api.unsplash.com//photos/random")!}
        // спросить как сделать unwrap тут, здесь что-то сложное
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
