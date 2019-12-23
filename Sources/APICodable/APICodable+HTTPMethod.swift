//
//  APICodable+HTTPMethod.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/08.
//

import Foundation

extension APICodable {
    
    func get<T>(_ request: T, with query: Query) -> T.Response? where T : APIRequest {
        
        let decoder = JSONDecoder()
        return try? decoder.decode(T.Response.self, from: Data())
    }
}
