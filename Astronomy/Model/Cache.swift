//
//  Cache.swift
//  Astronomy
//
//  Created by krikaz on 5/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key, Value> where Key: Hashable {
    private(set) var items: [Key: Value] = [:]
    
    func cache(key: Key, value: Value) {
        items[key] = value
    }
    
    func value(key: Key) -> Value {
        let result = items[key]!
        return result
    }
    
    func check(key: Key) -> Bool {
        guard let _ = items[key] else { return false }
        return true
    }
    

}
