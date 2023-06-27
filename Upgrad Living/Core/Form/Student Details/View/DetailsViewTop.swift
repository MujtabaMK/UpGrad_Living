//
//  DetailsViewTop.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI

struct DetailsViewTop: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var Step: String
    var body: some View {
        VStack{
            HStack{
                Text("Step")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                if Step == "1"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF8A4AB))
                        .overlay(
                            Text("1")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "2"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0x75D5DA))
                        .overlay(
                            Text("2")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "3"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0x685BC7))
                        .overlay(
                            Text("3")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        )
                }else if Step == "4"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0x3CA0D1))
                        .overlay(
                            Text("4")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        )
                }else if Step == "5"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xE75798))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        )
                }
                
                Text("of")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                
                if Step == "1"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "2"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "3"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "4"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }else if Step == "5"{
                    Circle()
                        .frame(width: 17, height: 17)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }
            }
            .padding(.bottom, 5)
            if Step == "1"{
                HStack{
                    Image("Student_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 235, alignment: .leading)
                    Text("Begin your journey by telling us about you...")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                        .frame(alignment: .leading)
                    Spacer()
                }
                Text("Student’s Details")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color(hex: 0xF15865))
                    .padding(.top, -30)
            }else if Step == "2"{
                HStack{
                    Image("Parent_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 235, alignment: .leading)
                    Text("Fill in your parent’s and/or guardian’s details")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                    Spacer()
                }
                Text("Parent’s Details")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color(hex: 0x00B2BA))
                    .padding(.top, -30)
            }else if Step == "3"{
                HStack{
                    Image("Enrollment_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 235, alignment: .leading)
                    Text("Fill in your enrollment details")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                    Spacer()
                }
                Text("Enrollment Details")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color(hex: 0x685BC7))
                    .padding(.top, -30)
            }else if Step == "4"{
                HStack{
                    Image("RoomType_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 235, alignment: .leading)
                    Text("Select your accommodation and payment options")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                    Spacer()
                }
                Text("Select the Room Type")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color(hex: 0x3CA0D1))
                    .padding(.top, -30)
            }else if Step == "5"{
                HStack{
                    Image("Medical_Question_Top")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 235, alignment: .leading)
                    Text("Choose your dietary requirements and medical information")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                    Spacer()
                }
                Text("Dietary Requirements")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .background(Color(hex: 0xE75798))
                    .padding(.top, -30)
            }
        }
    }
}
