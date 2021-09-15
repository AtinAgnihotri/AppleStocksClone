//
//  DateView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

struct DateView: View {
    private let DATE_FORMAT = "MMM d, yyyy"
    
    private var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = DATE_FORMAT
        return formatter.string(from: Date())
    }
    
    var body: some View {
        HStack {
            Text(date)
                .font(.system(size: 32))
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.leading, 20)
                .padding(.top, 20)
                .frame(alignment: .leading)
            
            Spacer()
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
