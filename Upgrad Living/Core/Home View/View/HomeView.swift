//
//  HomeView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 25/04/23.
//

import SwiftUI
import SwiftUIPager

struct HomeView: View {
    //Current Index...
    @State var currentIndex: Int = 0
    @State private var isButtonClick = false
    
    @State var pageIndex: Page
        
    var body: some View {
        //            //background Tab View...
        //            TabView(selection: $currentIndex) {
        //                ForEach(posts.indices, id: \.self){ index in
        //                    GeometryReader{ proxy in
        //                        Image(posts[index].postImage)
        //                            .resizable()
        //                            .aspectRatio(contentMode: .fill)
        //                            .frame(width: proxy.size.width, height: proxy.size.height)
        //                            .cornerRadius(1)
        //                    }
        //                    .ignoresSafeArea()
        //                    .offset(y: -100)
        //                }
        //            }
        //            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        //            .animation(.easeOut, value: currentIndex)
        //            .overlay(
        //                LinearGradient(colors: [
        //                    Color.clear,
        //                    Color.black.opacity(0.2),
        //                    Color.white.opacity(0.4),
        //                    Color.white,
        //                    Color.white,
        //                    Color.white,
        //                ], startPoint: .top, endPoint: .bottom)
        //            )
        //            .ignoresSafeArea()
        NavigationView {
            ScrollView{
                VStack{
                    VStack{
                        UpcomingEvents()
                            .padding(.bottom,20)
                        //Posts
                        SnapCarousel(spacing: getRect().height < 750 ? 0 : 0,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: posts) { post in
                            CardView(post: post)
                        }
                        
                        UpcomingEvents()
                            .padding(.top, 400)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
        
        //New Code
        
//        NavigationView {
//           // ScrollView{
//                VStack{
//                    Pager(page: self.pageIndex,
//                          data: posts,
//                          content: { item in
//                               // create a page based on item
//                        self.pageView(item: item)
//                    })
//                    .itemAspectRatio(0.7)
//                    .itemSpacing(0)
//                    .padding(8)
//                    .interactive(scale: 0.8)
//
//                    UpcomingEvents()
//                }
//            //}
//       // }
//
//    }
    
   // @ViewBuilder
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
        .frame(maxWidth: getRect().width, maxHeight: 400)
        .background(Color.yellow)
    }
    
    //@ViewBuilder
    func CardView(post: Post) -> some View{
       // ZStack{
            VStack(spacing: 10) {
                //Image
                
                GeometryReader { proxy in
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: 300)
                        .cornerRadius(25)
                }
                //            .padding(15)
                //            .background(Color.white)
                //.cornerRadius(25)
                .frame(height: 300)
                
                //Move Data...
                
                Text(post.title)
                    .font(.title2.bold())
                
                HStack(spacing: 3) {
                    ForEach(1...5, id: \.self){ index in
                        Image(systemName: "star.fill")
                            .foregroundColor(index <= post.starRaiting ? .yellow : .gray)
                    }
                    Text("(\(post.starRaiting).0)")
                }
                .font(.caption)
                Text(post.description)
                    .font(getRect().height < 750 ? .caption : .callout)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                    .padding(.horizontal)
            }
       // }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pageIndex: Page.withIndex(0))
    }
}

//Screen Bounds

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
