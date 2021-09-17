//
//  StocksListViewModel.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 15/09/21.
//

import Foundation

class StocksListViewModel: ObservableObject {
    
    @Published var searchTerm: String = "" {
        didSet {
            setFilteredStocks()
        }
    }
    @Published var stocks: [StockViewModel] = [StockViewModel]() {
        didSet {
            setFilteredStocks()
        }
    }
    @Published var filteredStocks: [StockViewModel] = [StockViewModel]()
    
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        let service = WebService()
        service.getStocks { [weak self] result in
            DispatchQueue.main.async {
                print("result, \(result)")
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
    
    private func setFilteredStocks() {
        filteredStocks = searchTerm.isEmpty ? stocks : stocks.filter { $0.symbol.lowercased().starts(with: searchTerm.lowercased()) }
    }
    
}
