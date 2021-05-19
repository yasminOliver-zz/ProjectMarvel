//
//  MarvelApi.swift
//  Marvel Comics
//
//  Created by user195476 on 5/18/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters"
    static private let privateKey = "e14ed6ec3607ba9207884399d284787097af2fdb"
    static private let publicKey = "85c4ef4620aa7c93dca948c1b300af4a"
    static private let limit = 50
    
    class func  loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo) -> Void ) {
        let offset = page * limit
        let startswith: String
       if let name = name, !name.isEmpty {
        startswith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
       }else{
        startswith = ""
       }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startswith + getCredentials()
        AF.request(url).responseJSON { (response) in
                guard let data = response.data,
                      let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from:data),
                      marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
                }
                onComplete(MarvelInfo)
                }
    
    }
    
    private class func  getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
    }
}

