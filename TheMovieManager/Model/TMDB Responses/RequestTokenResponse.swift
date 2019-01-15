//
//  RequestTokenResponse.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation


struct RequestTokenResponse : Codable {
    let success: Bool           //"success": true,
    let expiresAt: String       //"expires_at": "2018-12-25 14:59:32 UTC",
    let requestToken: String    //"request_token": "24da3cbd9ae34590da3d6be095ee0164e8f49c78"

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}

