//
//  PicsModel.swift
//  CollectionPinterest
//
//  Created by Сергей Грицаев on 15.11.2024.
//

import Foundation

struct Results: Decodable {
    let results: [UnsplashPhoto]

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var photos = [UnsplashPhoto]()
        while !container.isAtEnd {
            photos.append(try container.decode(UnsplashPhoto.self))
        }
        results = photos
    }
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: URLS
    
    struct URLS: Decodable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
}
