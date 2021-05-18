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

class Service {

    let baseURL = "http://gateway.marvel.com/v1/public/characters"
    let publicKey = "805792b34a75ce660032f2670720a020"
    let privateKey = "bb75958b56f0fc034efec0a6c4fdbe8cf4186f70"
    let ts = String(Date().timeIntervalSince1970)

    public func apiRequest() {
        let parameters = ["ts": ts, "hash": self.getMD5(), "apiKey" : publicKey]
        
        let request = AF.request(baseURL, parameters: parameters)
        
        request.responseJSON { (data) in
            print(data)
        }
    }
    
    private func getMD5() -> String {
        let apiData = ts + privateKey + publicKey
        guard let data = apiData.data(using: .utf8) else {return String()}
        let apiHash = Insecure.MD5.hash(data: data)
        return apiHash.map {String(format: "%02hhx", $0)}.joined()
    }

}

