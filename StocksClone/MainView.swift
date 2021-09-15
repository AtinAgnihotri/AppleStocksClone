//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var stocksListVM = StocksListViewModel()
    
    init() {
        UIAppearanceUtil.shared.setupBaseAppearance()
    }
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    DateView()
                    
                    SearchView(searchTerm: $stocksListVM.searchTerm)
                    
                    StocksListView(stocks: stocksListVM.stocks)
                    
                    Spacer()
                
                }.frame(alignment: .leading)
            }
            .navigationBarTitle("Stocks")
        }.onAppear {
            stocksListVM.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
