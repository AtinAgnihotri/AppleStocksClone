//
//  ContentView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import SwiftUI

struct ContentView: View {
    @State var vm = StocksListViewModel()
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                print("DL Start")
                vm.load()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
