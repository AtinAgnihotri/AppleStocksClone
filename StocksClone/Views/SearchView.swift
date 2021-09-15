//
//  SearchView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: self.$searchTerm)
                .foregroundColor(.primary)
                .padding(10)
            
            Spacer()
        }
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var searchTerm = ""
    static var previews: some View {
        SearchView(searchTerm: $searchTerm)
    }
}
