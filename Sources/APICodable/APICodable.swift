//
//  APICodable.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/09.
//

import Foundation

protocol APICodable {
    
    /// You must set api base URL string.
    var baseURLString: String { get }
    
    var query: Query { get }
}
