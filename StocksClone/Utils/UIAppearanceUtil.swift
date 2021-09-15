//
//  UIAppearanceUtil.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 16/09/21.
//

import SwiftUI

class UIAppearanceUtil {
    static let shared = UIAppearanceUtil()
    
    private init() {
        
    }
    
    func setupBaseAppearance() {
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
            UINavigationBar.appearance().barTintColor = backgroundColor
            UINavigationBar.appearance().largeTitleTextAttributes = titleAttrs
            UINavigationBar.appearance().titleTextAttributes = titleAttrs
        }
        
        UITableView.appearance().backgroundColor = .black
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .gray
        UITableViewCell.appearance().backgroundColor = .black
    }
}
