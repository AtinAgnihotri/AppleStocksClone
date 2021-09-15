//
//  DevTestUtil.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import Foundation

class DevTestUtil {
    static let shared = DevTestUtil()
    
    private init() {
        
    }
    
    var TEST_STOCK: Stock {
        Stock(symbol: "GOOG",
              description: "Alphabet Inc",
              price: 100.3378,
              change: "-12.3")
    }
}
