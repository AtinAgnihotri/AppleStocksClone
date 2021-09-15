//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct StocksListView: View {
    @State private var stocksListVM = StocksListViewModel()
    
    init() {
        let titleAttrs: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white]
        let backgroundColor: UIColor = .black
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = titleAttrs
            navBarAppearance.largeTitleTextAttributes = titleAttrs
            navBarAppearance.backgroundColor = backgroundColor
                    
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
//            UINavigationBar.appearance().barTintColor = backgroundColor
            UINavigationBar.appearance().largeTitleTextAttributes = titleAttrs
            UINavigationBar.appearance().titleTextAttributes = titleAttrs
        }
        
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    DateView()
                    
                    SearchView(searchTerm: $stocksListVM.searchTerm)
                    
                    Spacer()
                
                }.frame(alignment: .leading)
            }
            .navigationBarTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StocksListView()
    }
}
