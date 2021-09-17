//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stocksListVM = StocksListViewModel()
    
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    
    init() {
        UIAppearanceUtil.shared.setupBaseAppearance()
        stocksListVM.load()
    }
    
    var body: some View {
        return NavigationView {
//            ZStack(alignment: .leading) {
            ZStack {
                Color.black
                VStack (alignment: .leading){
                    DateView()
                    SearchView(searchTerm: $stocksListVM.searchTerm)
                    StocksListView(stocks: stocksListVM.filteredStocks)
                }

                NewsArticleView(articles: stocksListVM.news,
                                onDragBegan: { value in
                                    self.stocksListVM.dragOffset = value.translation
                                },
                                onDragEnd: { value in
                                    if value.translation.height < 0 {
                                        stocksListVM.dragOffset = CGSize(width: 0, height: 100)
                                    } else {
                                        stocksListVM.dragOffset = CGSize(width: 0, height: screenSize.height * 0.67)
                                    }
                                })
                    .animation(.spring())
                    .offset(y: stocksListVM.dragOffset.height)

            }.navigationBarTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
