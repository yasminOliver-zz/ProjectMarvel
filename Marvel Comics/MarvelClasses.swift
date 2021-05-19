//
//  MarvelClasses.swift
//  Marvel Comics
//
//  Created by user195476 on 5/18/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation

struct MarvelInfo: Codable {
    let code: Int
    let status: String
    let data: MarvelData

}

struct MarvelData: Codable{
    let offSet: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let url: [HeroURL]

}

struct Thumbnail: Codable {
    let path: String
    let ext: String
    
    enum codinkeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct HeroURL: Codable {
    let type: String
    let URL: String
}
