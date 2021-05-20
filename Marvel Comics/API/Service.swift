//
//  Service.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 20/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import Foundation
import Alamofire
import CryptoKit
import SwiftHash

class ApiService{
    
    static private let baseURL = "http://gateway.marvel.com/v1/public/characters"
    static private let privateKey = "e14ed6ec3607ba9207884399d284787097af2fdb"
    static private let publicKey = "85c4ef4620aa7c93dca948c1b300af4a"
    static private let limit = 50
    
    class func loadHeros(name:String?, page: Int = 0, onComplete: @escaping(MarvelCharacter?) -> Void) {
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
            guard let data = response.data else {
                onComplete(nil)
                return
                }
            do {
                let marvelCharacter = try JSONDecoder().decode(MarvelCharacter.self, from:data)
                onComplete(marvelCharacter)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
        }
            
        
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
