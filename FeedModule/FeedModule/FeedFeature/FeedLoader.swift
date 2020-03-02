//
//  FeedLoader.swift
//  FeedModule
//
//  Created by Denis Nefedov on 01.02.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

// it could be generic here, but for now it's no need
public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
