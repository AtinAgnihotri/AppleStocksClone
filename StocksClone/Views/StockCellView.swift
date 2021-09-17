//
//  StockCellView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

struct StockCellView: View {
    let stock: StockViewModel
    
    var changeColor: Color {
        stock.change.contains("-") ? .red : .green
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text(stock.description)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack {
                Text(stock.price)
                    
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Button(stock.change) {
                    
                }
                .font(.system(size: 15))
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .background(changeColor)
                .cornerRadius(5)
            }
        }
        .foregroundColor(.white)
        .cornerRadius(10)
        .listRowBackground(Color.black)
    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = StockViewModel(stock: DevTestUtil.shared.TEST_STOCK)
        return StockCellView(stock: stock)
    }
}
