//
//  RemoteFeedLoaderTest.swift
//  FeedModuleTests
//
//  Created by Denis Nefedov on 01.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import XCTest
import FeedModule

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesnotRequestDataFromURL() {
        let (client,_) = makeSUT()
        
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "http://custom-url.com")!
        let (client, sut) = makeSUT(url: url)
        sut.load()
        
       XCTAssertEqual(client.requestedURL, url)
    }
    
    private func makeSUT(url: URL = URL(string: "http://example.com")!) -> (HTTPClientSpy, RemoteFeedLoader) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client, url: url)
        return (client, sut)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
    
}
