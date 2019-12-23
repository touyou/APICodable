//
//  Query.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/09.
//

import Foundation

public struct Query {
    
    private var queries: [(String, Any)] = []
    
    internal var queryString: String? {
        
        return queries.reduce("?", { (queryString, query) in
            
            return queryString + "\(query.0)=\(query.1)&"
        })
    }
    
    public mutating func add(_ key: String, _ value: Any) {
        
        queries.append((key, value))
    }
    
    internal mutating func merge(with query: Query) {
        
        queries.append(contentsOf: query.queries)
    }
}
