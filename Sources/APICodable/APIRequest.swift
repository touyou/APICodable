//
//  APIRequest.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/09.
//

import Foundation

protocol APIRequest {
    var type: Codable.Type { get }
    var requestPath: String { get }
}

enum Request: APIRequest {
    case user
    case events(String)

    var type: Codable.Type {
        switch self {
        case .user:
            return User.self
        case .events(_):
            return [Event].self
        }
    }

    var requestPath: String {
        switch self {
        case .user:
            return "/user"
        case .events(let loginName):
            return "/user/\(loginName)/received_events"
        }
    }
}

struct User: Codable {}
struct Event: Codable {}
