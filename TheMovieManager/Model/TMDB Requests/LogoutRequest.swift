//
//  Logout.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation

struct LogoutRequest : Codable {
    let sessionId: String           //"session_id": "14ceeff4c582be5502e9cf9bc3d41f09f2bd88ef"

    enum codingKeys: String, CodingKey {
        case sessionId = "session_id"
    }
}
