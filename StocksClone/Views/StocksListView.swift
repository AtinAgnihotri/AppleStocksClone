//
//  StocksListView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

struct StocksListView: View {
    let stocks: [StockViewModel]
    
    private var noStocks: Bool {
        stocks.isEmpty
    }
    
    var body: some View {
        print("Stocks List Redrawn with \(stocks)")
        
        return List {
            ForEach (stocks, id:\.symbol){ stock in
                StockCellView(stock: stock)
                    .disabled(true)
            }
        }
        .animation(noStocks ? nil : .default)
    }
}

struct StocksListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = DevTestUtil.shared.TEST_STOCK
        return StocksListView(stocks: [StockViewModel(stock: stock)])
    }
}
