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
        
    }
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesnotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
}
