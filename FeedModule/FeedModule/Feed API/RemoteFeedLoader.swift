//
//  RemoteFeedLoader.swift
//  FeedModule
//
//  Created by Denis Nefedov on 03.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

final public class RemoteFeedLoader: FeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult<Error>
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result)->Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else {return}
            
            switch result {
            case .failure:
                completion(.failure(.connectivity))
            case let .success(data, response):
                completion(FeedItemsMapper.map(data, from: response))
            }
            
        }
    }
}
