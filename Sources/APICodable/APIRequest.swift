//
//  APIRequest.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/09.
//

import Foundation

protocol APIRequest {
    /// Set response type adopted Codable
    associatedtype Response: Codable
    
    /// Set request path string
    var requestPath: String { get }
}
//
//enum Request: APIRequest {
//    typealias Response = T
//
//    case user
//    case events(String)
//}
