//
//  HTTPClient.swift
//  FeedModule
//
//  Created by Denis Nefedov on 01.03.2020.
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
