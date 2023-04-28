//
//  HomeView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 25/04/23.
//

import SwiftUI

struct HomeView: View {
    //Current Index...
    @State var currentIndex: Int = 0
    @State private var isButtonClick = false
    var body: some View {
        ZStack{
            VStack{
                if isButtonClick{
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Book a space or a guest room")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x00B2BA))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Student Connect")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x00B2BA))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Request Approval")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x00B2BA))
                        }
                        
                    }
                    
                    Button {
                        isButtonClick = true
                    } label: {
                        Image(isButtonClick ? "Home_Button_Open" : "Home_Button_NotOpen")
                    }

                }
            }
            
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
            
            //Posts
            SnapCarousel(spacing: getRect().height < 750 ? 0 : 0,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: posts) { post in
                CardView(post: post)
            }
            .offset(y: -70)

        }
    }
    
    @ViewBuilder
    func CardView(post: Post) -> some View{
        ZStack{
            VStack(spacing: 10) {
                //Image
                
                GeometryReader { proxy in
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .cornerRadius(25)
                }
                //            .padding(15)
                //            .background(Color.white)
                .cornerRadius(25)
                .frame(height: getRect().height / 2.5)
                
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
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                    .padding(.horizontal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//Screen Bounds

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
