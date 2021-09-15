//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct StocksListView: View {
    @State var vm = StocksListViewModel()
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .leading) {
                Color.black
                
                VStack (){
                    Text("Sep 15, 2021")
                        .font(.system(size: 32))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                
                }
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
