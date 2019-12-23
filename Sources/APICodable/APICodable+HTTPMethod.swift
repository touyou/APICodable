//
//  APICodable+HTTPMethod.swift
//  APICodablePackageDescription
//
//  Created by 藤井陽介 on 2018/03/08.
//

import Foundation
import Combine

extension APICodable {
    
    func get<T>(_ request: T, with query: Query) -> AnyPublisher<Any, Error>? where T: APIRequest {

        let urlString = baseURLString + request.requestPath + (query.queryString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        guard let url = URL(string: urlString) else {
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in

                guard let response = output.response as? HTTPURLResponse,
                    response.statusCode == 200 else {
                        throw HTTPError.statusCode
                }
                return output.data
        }
        .decode(type: request.type, decoder: decoder)
        .eraseToAnyPublisher()
    }
}
