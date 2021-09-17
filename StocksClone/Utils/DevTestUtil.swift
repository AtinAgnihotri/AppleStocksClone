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
    
    var TEST_NEWS: NewsArticle {
        NewsArticle(title: "The Bull Market is Charging into 2020",
                    publication: "The Wallstreet Journal",
                    imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
    }
}
