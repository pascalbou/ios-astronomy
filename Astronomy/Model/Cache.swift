//
//  Cache.swift
//  Astronomy
//
//  Created by krikaz on 5/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key, Value> where Key: Hashable {
    private(set) var cachedItems: [Key: Value] = [:]
    
    func cache(key: Key, value: Value) {
        cachedItems[key] = value
    }
    
    func value(key: Key) -> Value {
        let result = cachedItems[key]!
        return result
    }
}
