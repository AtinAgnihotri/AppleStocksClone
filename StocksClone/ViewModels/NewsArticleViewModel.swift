//
//  NewsArticleViewModel.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 17/09/21.
//

import Foundation

struct NewsArticleViewModel {
    let article: NewsArticle
}

extension NewsArticleViewModel {
    var title: String {
        article.title
    }
    
    var publication: String {
        article.publication.uppercased()
    }
    
    var WEB_IMAGE_URL: URL? {
        guard let url = URL(string: article.imageURL) else {
            return nil
        }
        return url
    }
}
