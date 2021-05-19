//
//  ApiService.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 14/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import UIKit
import Alamofire
import CryptoKit
import SwiftHash

class Service {

    static private let baseURL = "http://gateway.marvel.com/v1/public/characters"
    static private let publicKey = "805792b34a75ce660032f2670720a020"
    static private let privateKey = "bb75958b56f0fc034efec0a6c4fdbe8cf4186f70"
    static private let limit = 50

    class func loadHeros(name:String?, page: Int = 0, onComplete: @escaping (MarvelCharacter?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: "", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = baseURL + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
            
        AF.request(url).responseJSON { (response) in
        guard let data = response.data,
            let marvelCharacter = try? JSONDecoder().decode(MarvelCharacter.self, from:data),
                marvelCharacter.code == 200 else {
                    onComplete(nil)
                    return
        }
        onComplete(marvelCharacter)
        }
    }
        
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}

