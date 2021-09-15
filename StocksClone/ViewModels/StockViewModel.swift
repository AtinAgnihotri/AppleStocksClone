//
//  StockViewModel.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 15/09/21.
//

import Foundation

struct StockViewModel {
    let stock: Stock
}

extension StockViewModel {
    var symbol: String {
        stock.symbol.uppercased()
    }
    
    var description: String {
        stock.description
    }
    
    var price: String {
        String(format: "%.2f", stock.price)
    }
    
    var change: String {
        stock.change
    }
}
