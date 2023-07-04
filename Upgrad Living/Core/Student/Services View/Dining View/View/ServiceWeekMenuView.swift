//
//  ServiceWeekMenuView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import SwiftUI
import Kingfisher

struct ServiceWeekMenuView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var arrMeal: [ServiceMeal]
    var daysToPass: String
    
    @State var currentIndex: Int = 0
    @State var changeValue = false
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HStack{
                    Text(daysToPass)
                        .font(.custom(OpenSans_Bold, size: 16))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                    Spacer()
                }
            }
            .padding(.leading)
            .frame(width: getRect().width, height: 34)
            .background(colorScheme == .light ? Color(hex: 0xF1F1F1) : Color(hex: 0xF1F1F1))
            .cornerRadius(2)
            .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(Array(arrMeal.enumerated()), id: \.offset) { index, food in
                        Button {
                            changeValue = true
                            currentIndex = index
                        } label: {
                            Rectangle()
                                .fill(currentIndex == index ? Color(hex: 0xD9404C) : Color(hex: 0xFFFFFF))
                                .frame(width: 80, height: 38)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                .overlay {
                                    Text(food.mealName ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(currentIndex == index ? .white : .black)
                                }
                        }
                    }
                }
                .frame(width: getRect().width - 20, alignment: .center)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 4)
            }
            .frame(width: getRect().width - 20, alignment: .center)
            
            //Posts
            SnapCarouselDining(changeValue: $changeValue, spacing: getRect().height < 750 ? 10 : 10,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: arrMeal) { post in
                CardView(post: post)
            }
            .frame(height: 300)
        }
        .padding(.bottom, 30)
    }
    
    //@ViewBuilder
    func CardView(post: ServiceMeal) -> some View{
        ZStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    KFImage(URL(string: post.foodImage ?? ""))
                        .resizable()
                        .scaledToFit()
                    
                    //Move Data...
                    
                    ForEach(post.food ?? [], content: { food in
                        VStack(alignment: .leading, spacing: 0){
                            HStack(spacing: 3){
                                HLine()
                                    .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [2]))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0xEE2C3C) : Color(hex: 0xEE2C3C))
                                    .frame(width: 19,height: 1)
                                Text(food.foodName ?? "")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                            }
                        }
                        .padding(.leading, 5)
                    })
                }
            }
        }
        .padding(.bottom)
        .background(colorScheme == .light ? Color.white : Color(.black))
        .cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
        .shadow(color: .gray, radius: 3, x: 0, y: 0)
    }
}
