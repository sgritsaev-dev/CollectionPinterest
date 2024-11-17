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
                // спросить зачем completion(nil) и что это вообще значит...
                // по идее completion это как return, только мы заранее прописываем, что мы ожидаем от return, чтобы это использовать
            }
            let decode = self.decodeJSON(type: Results.self, from: data)
            completion(decode)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch _ {
            return nil
        }
    }
}
