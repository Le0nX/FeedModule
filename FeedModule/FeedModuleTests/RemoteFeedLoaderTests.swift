//
//  RemoteFeedLoaderTest.swift
//  FeedModuleTests
//
//  Created by Denis Nefedov on 01.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import XCTest


class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "http://example.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesnotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        
        let sut = RemoteFeedLoader()
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
