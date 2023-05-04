//
//  PagerHome.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 02/05/23.
//

import SwiftUI
import SwiftUIPager

struct PagerHome: View {
    @State var pageIndex: Page
    var body: some View {
        VStack{
            Pager(page: self.pageIndex,
                  data: posts,
                  content: { item in
                       // create a page based on item
                self.pageView(item: item)
            })
            .itemAspectRatio(0.7)
            .itemSpacing(0)
            .padding(8)
            .interactive(scale: 0.8)

            UpcomingEvents()
        }
    }
    @ViewBuilder
    func pageView(item: Post) -> some View{
        VStack(spacing: 10){
            Image(item.postImage)
                .resizable()
                .scaledToFit()
//                .cornerRadius(12)
            
            Text(item.title)
                .font(.title2.bold())
            
            HStack(spacing: 3) {
                ForEach(1...5, id: \.self){ index in
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= item.starRaiting ? .yellow : .gray)
                }
                Text("(\(item.starRaiting).0)")
                    .multilineTextAlignment(.center)
            }
            .font(.caption)
            Text(item.description)
                .font(getRect().height < 750 ? .caption : .callout)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.horizontal)
        }
        .frame(maxWidth: getRect().width, maxHeight: 300)
        .background(Color.yellow)
    }
}

//struct PagerHome_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerHome(pageIndex: 1)
//    }
//}
