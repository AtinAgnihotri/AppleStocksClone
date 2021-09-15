//
//  StocksListViewModel.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 15/09/21.
//

import Foundation

class StocksListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]() {
        didSet {
            print(stocks)
        }
    }
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        let service = WebService()
        service.getStocks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let stockList):
                    if let stockList = stockList {
                        self?.stocks = stockList.map(StockViewModel.init)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
