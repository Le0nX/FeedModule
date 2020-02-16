//
//  RemoteFeedLoader.swift
//  FeedModule
//
//  Created by Denis Nefedov on 03.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

final public class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error)->Void) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}
