//
//  Stock.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
