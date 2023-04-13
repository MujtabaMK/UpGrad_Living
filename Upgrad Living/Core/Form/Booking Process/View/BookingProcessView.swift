//
//  BookingProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import SwiftUI

struct BookingProcessView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isStudentDetails = false
    @State private var isButtonClick = false
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Booking Process")
                        .font(.custom(OpenSans_Bold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                        .padding(.top)
                    Divider()
                    ScrollView(showsIndicators: false) {
                        ZStack{
                            VStack{
                                VStack{
                                    VStack{
                                        VStack{
                                            BookingProcessLogin_Image()
                                        }
                                    }
                                    .padding(.top, 40)
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFF4F6))
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFF4F6))
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                )
                                .padding(.top, 200)
                                VStack{
                                    DetailsViewBottom(textName: "Let’s go", imageName: "lets_go_Image")
                                        .padding(.top, 20)
                                        .padding(.bottom, 20)
                                        .onTapGesture {
                                            withAnimation {
                                                isButtonClick = true
                                                isStudentDetails = true
                                            }
                                        }
                                        .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                                }
                            }
                            HStack{
                                Text("The booking process at upGrad Living consists of \nnine easy steps... ")
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                                    .padding(.leading, 5)
                                Image("Booking_Process_Top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 186, height: 205)
                            }
                            .padding(.top, -860)
                        }
                    }
                }
                NavigationLink("", destination: StudentDetailsView(getIsEditable: "1").navigationBarHidden(true),isActive: $isStudentDetails).isDetailLink(false)
            }
            .navigationBarHidden(true)
        }
    }
}

struct VLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct BookingProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingProcessView()
    }
}
