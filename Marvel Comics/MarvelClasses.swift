//
//  MarvelClasses.swift
//  
//
//  Created by user191958 on 5/18/21.
//

import Foundation

struct MarvelInfo: Codable {
    let code: Int
    let status: String
    let data: MarvelData
    
}

struct MarvelData:Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let result: [Hero]
}

struct HeroURL: Codable{
    let type: String
    let url: String
    }

struct Hero:Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let url: [HeroURL]
}

struct Thumbnail: Codable{
    let path: String
    let ext: String
    
    enum CodinKeys: String, CodingKey {
        case path
        case ext = "extension"
    }

}
