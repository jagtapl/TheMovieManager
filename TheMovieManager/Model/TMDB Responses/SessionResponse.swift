//
//  SessionResponse.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation

struct SessionResponse : Codable {
    let success: Bool           //"success": true,
    let sessionId: String      //"session_id": "fd5b857c5214b00a5b847d9fd41723730f1115d9"
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
