//
//  News.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 09/09/21.
//

import Foundation

struct News: Decodable {
    let title: String
    let publication: String
    let imageURL: String
}

extension News {
    var WEB_IMAGE_URL: URL? {
        guard let url = URL(string: imageURL) else {
            return nil
        }
        return url
    }
}
