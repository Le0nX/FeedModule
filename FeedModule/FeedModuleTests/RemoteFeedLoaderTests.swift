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
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
        
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "http://custom-url.com")!
        let (client, sut) = makeSUT(url: url)
        sut.load()
        
       XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestDataFromURL() {
        let url = URL(string: "http://custom-url.com")!
        let (client, sut) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
       XCTAssertEqual(client.requestedURLs, [url,url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (client, sut) = makeSUT()
        client.error = NSError(domain: "Test", code: 0)
        
        var capturedError: RemoteFeedLoader.Error?
        sut.load() { error in
            capturedError = error
        }
        
        XCTAssertEqual(capturedError, .connectivity)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "http://example.com")!) -> (HTTPClientSpy, RemoteFeedLoader) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client, url: url)
        return (client, sut)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        var error: Error?
        
        func get(from url: URL, completion: @escaping (Error) -> Void) {
            
            if let error = error {
                completion(error)
            }
            
            requestedURLs.append(url)
        }
    }
    
}
