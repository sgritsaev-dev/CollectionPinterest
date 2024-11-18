//
//  RandomPicsFetcher.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 15.11.2024.
//

import Foundation

final class RandomPicsFetcher {
    
    var networkService = RandomPicsNetworkService()
    
    func fetchRandomPics(completion: @escaping (Results?) -> ()) {
        networkService.requestPics { (data, error) in
            if error != nil {
                completion(nil)
            }
            let results = self.decodeJSON(from: data)
            completion(results)
        }
    }
    
    private func decodeJSON(from data: Data?) -> Results? {
        guard let data = data else { return nil }
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode([UnsplashPhoto].self, from: data)
            return Results(results: results)
        } catch {
            return nil
        }
    }
}
