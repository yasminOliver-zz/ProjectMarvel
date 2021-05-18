//
//  ApiService.swift
//  Marvel Comics
//
//  Created by Cassia Franco on 14/05/21.
//  Copyright © 2021 Yasmin Oliveira. All rights reserved.
//

import UIKit
import Alamofire

class Service {

    let baseURL = "http://gateway.marvel.com/v1/public/character"
    let publicKey = "805792b34a75ce660032f2670720a020"
    let privateKey = "bb75958b56f0fc034efec0a6c4fdbe8cf4186f70"
    let ts = String(Date().timeIntervalSince1970)
    let limiti = 50

}

