//
//  APIClient.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import Foundation

// TODO: - Move to the separated file Resource.swift
struct Resource {
    let url: URL
    let method: String = "GET"
}

// TODO: - Move to the separated file GenericResult.swift
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIClientError: Error {
    case noData
}

// TODO: - Move to the separated file URLRequest+Resource.swift
extension URLRequest {
    
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
    }
    
}

final class APIClient {
    //load data from a url
    func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIClientError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            // to resolve issue created as data was not decoding
            let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8) ?? Data()
            result(.success(utf8Data))
        }
        task.resume()
    }
    
}
