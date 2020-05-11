//
//  Cache.swift
//  Astronomy
//
//  Created by krikaz on 5/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    private(set) var items: [Key: Value] = [:]
    private let queue = DispatchQueue(label: "Caching Queue")
    
    func cache(for key: Key, value: Value) {
        queue.async {
            self.items[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        queue.sync {
            return self.items[key]
        }
    }
    
}
