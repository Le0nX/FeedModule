//
//  RemoteFeedLoader.swift
//  FeedModule
//
//  Created by Denis Nefedov on 03.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

final public class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result)->Void) {
        client.get(from: url) { result in
            
            switch result {
            case .failure:
                completion(.failure(.connectivity))
            case .success:
                completion(.failure(.invalidData))
            }
            
        }
    }
}
