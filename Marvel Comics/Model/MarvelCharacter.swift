//
//  Characters.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 14/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation

struct MarvelCharacter: Codable{
    let code: Int
    let status: String
    let data: MarvelData
}

struct MarvelData: Codable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

struct Hero: Codable{
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let url: [HeroURL]

}

struct Thumbnail: Codable{
    let path: String
    let ext : String
    
    var url: String{
        return path + "." + ext
    }
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct HeroURL: Codable{
    let type: String
    let url: String
}
