//
//  NewsArticleView.swift
//  StocksClone
//
//  Created by Atin Agnihotri on 17/09/21.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let articles: [NewsArticleViewModel]
    let onDragBegan: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var screenSize: CGSize {
        print(UIScreen.main.bounds.size.height)
        return UIScreen.main.bounds.size
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        
                    Text("From 🍎News")
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                }
                
                Spacer()
            }
            .padding()
            .contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged(onDragBegan)
                        .onEnded(onDragEnd))
            ScrollView {
                VStack {
                    ForEach(articles, id:\.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                            if let url = article.WEB_IMAGE_URL {
                                URLImage(url) { image in
                                    image.resizable()
                                }.frame(width: 100, height: 100)
                            }
                        }.padding(10)
                    }
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
        }.frame(width: screenSize.width, height: screenSize.height * 0.8)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(articles: [NewsArticleViewModel(article: DevTestUtil.shared.TEST_NEWS)], onDragBegan: { _  in }, onDragEnd: { _  in })
    }
}
