//
//  StocksListView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

struct StocksListView: View {
    let stocks: [StockViewModel]
    
    var body: some View {
        List {
            ForEach (stocks, id:\.symbol){ stock in
                StockCellView(stock: stock)
                    .disabled(true)
            }
        }
    }
}

struct StocksListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = DevTestUtil.shared.TEST_STOCK
        return StocksListView(stocks: [StockViewModel(stock: stock)])
    }
}
