//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stocksListVM = StocksListViewModel()
    
    private var noFilteredStocks: Bool {
        stocksListVM.filteredStocks.isEmpty
    }
    
    init() {
        UIAppearanceUtil.shared.setupBaseAppearance()
        stocksListVM.load()
    }
    
    var body: some View {
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    DateView()
                    SearchView(searchTerm: $stocksListVM.searchTerm)
                    StocksListView(stocks: stocksListVM.filteredStocks)
                    Spacer()
                }.frame(alignment: .leading)
            }
            .navigationBarTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
