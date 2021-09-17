//
//  StocksListViewModel.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 15/09/21.
//

import Foundation
import SwiftUI

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
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 400) {
        didSet {
            print("dragOffset height: \(dragOffset.height)")
        }
    }
    
    
    func load() {
        fetchStocks()
        fetchNews()
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
    
    private func setFilteredStocks() {
        filteredStocks = searchTerm.isEmpty ? stocks : stocks.filter { $0.symbol.lowercased().starts(with: searchTerm.lowercased()) }
    }
    
    private func fetchNews() {
        let service = WebService()
        service.getTopNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let topNews):
                    if let topNews = topNews {
                        self?.news = topNews.map(NewsArticleViewModel.init)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
