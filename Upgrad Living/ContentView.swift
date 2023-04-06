//
//  ContentView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
//import SVGView

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isUpper = false
    @State private var isLeft = false
    @State private var isRight = false
    @State private var isBottom = false
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Button {
                        withAnimation() {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Image("back_Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 20)
                    }
                    Spacer(minLength: 0)
                    Text("Declaration")
                        .font(.custom(OpenSans_SemiBold, size: 18))
                        .foregroundColor(Color(hex: 0x000000))
                        .padding(.trailing, 30)
                    Spacer(minLength: 0)
                }
                .padding(.top)
                Divider()
                Spacer()
                
                EmailShape()
                    .frame(width: 60, height: 50)
                    .foregroundColor(.black)
                    .onTapGesture {
                        print("Clicked")
                    }
                
                ZStack{
                    ZStack{
                        EmailBorder()
                    }
                    ZStack{
                        EmailUpper()
                            .foregroundColor(isUpper ? .blue : .white)
                            .onTapGesture {
                                print("Upper")
                                isUpper.toggle()
                            }
                    }
                    ZStack{
                        EmailLeft()
                            .foregroundColor(isLeft ? .red : .white)
                            .onTapGesture {
                                print("Left")
                                isLeft.toggle()
                            }
                    }
                    ZStack{
                        EmailRight()
                            .foregroundColor(isRight ? .orange : .white)
                            .onTapGesture {
                                print("Right")
                                isRight.toggle()
                            }
                    }
                    ZStack{
                        EmailBotton()
                            .foregroundColor(isBottom ? .purple : .white)
                            .onTapGesture {
                                print("Bottom")
                                isBottom.toggle()
                            }
                    }
                }
                .frame(width: 100, height: 90)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct BloodGroupView: Shape {
//    func path(in rect: CGRect) -> Path {
//
//        var path = Path()
//        let width = rect.size.width
//        let height = rect.size.height
//        path.move(to: CGPoint(x: 0.35922*width, y: 0.04077*height))
//        path.addLine(to: CGPoint(x: 0.3571*width, y: 0.03655*height))
//        path.addCurve(to: CGPoint(x: 0.23091*width, y: 0.03953*height), control1: CGPoint(x: 0.3273*width, y: -0.01119*height), control2: CGPoint(x: 0.26389*width, y: -0.01417*height))
//        path.addLine(to: CGPoint(x: 0.03546*width, y: 0.47062*height))
//        path.addCurve(to: CGPoint(x: 0.00853*width, y: 0.72891*height), control1: CGPoint(x: 0.00062*width, y: 0.54842*height), control2: CGPoint(x: -0.00894*width, y: 0.64016*height))
//        path.addCurve(to: CGPoint(x: 0.22451*width, y: 0.98873*height), control1: CGPoint(x: 0.03375*width, y: 0.85699*height), control2: CGPoint(x: 0.11853*width, y: 0.95896*height))
//        path.addCurve(to: CGPoint(x: 0.29439*width, y: 0.99847*height), control1: CGPoint(x: 0.2478*width, y: 0.99526*height), control2: CGPoint(x: 0.27123*width, y: 0.99847*height))
//        path.addCurve(to: CGPoint(x: 0.47818*width, y: 0.92111*height), control1: CGPoint(x: 0.36105*width, y: 0.99847*height), control2: CGPoint(x: 0.42555*width, y: 0.97182*height))
//        path.addCurve(to: CGPoint(x: 0.58973*width, y: 0.64106*height), control1: CGPoint(x: 0.54907*width, y: 0.85281*height), control2: CGPoint(x: 0.58973*width, y: 0.75075*height))
//        path.addCurve(to: CGPoint(x: 0.53601*width, y: 0.43554*height), control1: CGPoint(x: 0.58973*width, y: 0.56589*height), control2: CGPoint(x: 0.57072*width, y: 0.49399*height))
//        path.addLine(to: CGPoint(x: 0.35922*width, y: 0.04077*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.45294*width, y: 0.88263*height))
//        path.addCurve(to: CGPoint(x: 0.23368*width, y: 0.94078*height), control1: CGPoint(x: 0.39175*width, y: 0.94156*height), control2: CGPoint(x: 0.31183*width, y: 0.96283*height))
//        path.addCurve(to: CGPoint(x: 0.04799*width, y: 0.71745*height), control1: CGPoint(x: 0.14256*width, y: 0.91518*height), control2: CGPoint(x: 0.06967*width, y: 0.82753*height))
//        path.addCurve(to: CGPoint(x: 0.07107*width, y: 0.49418*height), control1: CGPoint(x: 0.03264*width, y: 0.63941*height), control2: CGPoint(x: 0.04063*width, y: 0.56213*height))
//        path.addLine(to: CGPoint(x: 0.26487*width, y: 0.06622*height))
//        path.addCurve(to: CGPoint(x: 0.32361*width, y: 0.06449*height), control1: CGPoint(x: 0.2788*width, y: 0.04383*height), control2: CGPoint(x: 0.30892*width, y: 0.04307*height))
//        path.addLine(to: CGPoint(x: 0.50178*width, y: 0.46172*height))
//        path.addCurve(to: CGPoint(x: 0.54918*width, y: 0.64106*height), control1: CGPoint(x: 0.53279*width, y: 0.51422*height), control2: CGPoint(x: 0.54918*width, y: 0.57626*height))
//        path.addCurve(to: CGPoint(x: 0.45295*width, y: 0.88263*height), control1: CGPoint(x: 0.54916*width, y: 0.73567*height), control2: CGPoint(x: 0.5141*width, y: 0.8237*height))
//        path.addLine(to: CGPoint(x: 0.45294*width, y: 0.88263*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.46503*width, y: 0.64461*height))
//        path.addCurve(to: CGPoint(x: 0.44474*width, y: 0.66921*height), control1: CGPoint(x: 0.45382*width, y: 0.64461*height), control2: CGPoint(x: 0.44474*width, y: 0.65562*height))
//        path.addCurve(to: CGPoint(x: 0.40104*width, y: 0.77886*height), control1: CGPoint(x: 0.44474*width, y: 0.71214*height), control2: CGPoint(x: 0.42881*width, y: 0.75211*height))
//        path.addCurve(to: CGPoint(x: 0.30138*width, y: 0.80527*height), control1: CGPoint(x: 0.37327*width, y: 0.8057*height), control2: CGPoint(x: 0.33695*width, y: 0.81531*height))
//        path.addCurve(to: CGPoint(x: 0.27704*width, y: 0.82366*height), control1: CGPoint(x: 0.2905*width, y: 0.80228*height), control2: CGPoint(x: 0.27958*width, y: 0.81046*height))
//        path.addCurve(to: CGPoint(x: 0.29222*width, y: 0.8532*height), control1: CGPoint(x: 0.27451*width, y: 0.83691*height), control2: CGPoint(x: 0.28132*width, y: 0.85012*height))
//        path.addCurve(to: CGPoint(x: 0.32907*width, y: 0.85833*height), control1: CGPoint(x: 0.3045*width, y: 0.85666*height), control2: CGPoint(x: 0.31684*width, y: 0.85833*height))
//        path.addCurve(to: CGPoint(x: 0.42629*width, y: 0.81737*height), control1: CGPoint(x: 0.36431*width, y: 0.85833*height), control2: CGPoint(x: 0.39843*width, y: 0.84422*height))
//        path.addCurve(to: CGPoint(x: 0.48531*width, y: 0.6692*height), control1: CGPoint(x: 0.46381*width, y: 0.78127*height), control2: CGPoint(x: 0.48531*width, y: 0.72722*height))
//        path.addCurve(to: CGPoint(x: 0.46503*width, y: 0.64461*height), control1: CGPoint(x: 0.48531*width, y: 0.65562*height), control2: CGPoint(x: 0.47623*width, y: 0.64461*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.19688*width, y: 0.52601*height))
//        path.addCurve(to: CGPoint(x: 0.1145*width, y: 0.62592*height), control1: CGPoint(x: 0.15146*width, y: 0.52601*height), control2: CGPoint(x: 0.1145*width, y: 0.57082*height))
//        path.addCurve(to: CGPoint(x: 0.19688*width, y: 0.72582*height), control1: CGPoint(x: 0.1145*width, y: 0.68102*height), control2: CGPoint(x: 0.15146*width, y: 0.72582*height))
//        path.addCurve(to: CGPoint(x: 0.27926*width, y: 0.62592*height), control1: CGPoint(x: 0.2423*width, y: 0.72582*height), control2: CGPoint(x: 0.27926*width, y: 0.68102*height))
//        path.addCurve(to: CGPoint(x: 0.19688*width, y: 0.52601*height), control1: CGPoint(x: 0.27926*width, y: 0.57082*height), control2: CGPoint(x: 0.2423*width, y: 0.52601*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.19688*width, y: 0.67663*height))
//        path.addCurve(to: CGPoint(x: 0.15506*width, y: 0.62592*height), control1: CGPoint(x: 0.17382*width, y: 0.67663*height), control2: CGPoint(x: 0.15506*width, y: 0.65387*height))
//        path.addCurve(to: CGPoint(x: 0.19688*width, y: 0.57521*height), control1: CGPoint(x: 0.15506*width, y: 0.59797*height), control2: CGPoint(x: 0.17382*width, y: 0.57521*height))
//        path.addCurve(to: CGPoint(x: 0.23869*width, y: 0.62592*height), control1: CGPoint(x: 0.21994*width, y: 0.57521*height), control2: CGPoint(x: 0.23869*width, y: 0.59797*height))
//        path.addCurve(to: CGPoint(x: 0.19688*width, y: 0.67663*height), control1: CGPoint(x: 0.23869*width, y: 0.65387*height), control2: CGPoint(x: 0.21992*width, y: 0.67663*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.9038*width, y: 0.0312*height))
//        path.addLine(to: CGPoint(x: 0.56801*width, y: 0.0312*height))
//        path.addCurve(to: CGPoint(x: 0.49318*width, y: 0.12193*height), control1: CGPoint(x: 0.52676*width, y: 0.0312*height), control2: CGPoint(x: 0.49318*width, y: 0.07188*height))
//        path.addCurve(to: CGPoint(x: 0.56801*width, y: 0.2127*height), control1: CGPoint(x: 0.49318*width, y: 0.17199*height), control2: CGPoint(x: 0.52675*width, y: 0.2127*height))
//        path.addLine(to: CGPoint(x: 0.9038*width, y: 0.2127*height))
//        path.addCurve(to: CGPoint(x: 0.97864*width, y: 0.12193*height), control1: CGPoint(x: 0.94507*width, y: 0.2127*height), control2: CGPoint(x: 0.97864*width, y: 0.17197*height))
//        path.addCurve(to: CGPoint(x: 0.9038*width, y: 0.0312*height), control1: CGPoint(x: 0.97863*width, y: 0.07189*height), control2: CGPoint(x: 0.94506*width, y: 0.0312*height))
//        path.closeSubpath()
//        path.move(to: CGPoint(x: 0.9038*width, y: 0.16351*height))
//        path.addLine(to: CGPoint(x: 0.56801*width, y: 0.16351*height))
//        path.addCurve(to: CGPoint(x: 0.53375*width, y: 0.12191*height), control1: CGPoint(x: 0.54912*width, y: 0.16351*height), control2: CGPoint(x: 0.53375*width, y: 0.14488*height))
//        path.addCurve(to: CGPoint(x: 0.56801*width, y: 0.08037*height), control1: CGPoint(x: 0.53375*width, y: 0.099*height), control2: CGPoint(x: 0.54912*width, y: 0.08037*height))
//        path.addLine(to: CGPoint(x: 0.9038*width, y: 0.08037*height))
//        path.addCurve(to: CGPoint(x: 0.93807*width, y: 0.12191*height), control1: CGPoint(x: 0.9227*width, y: 0.08037*height), control2: CGPoint(x: 0.93807*width, y: 0.099*height))
//        path.addCurve(to: CGPoint(x: 0.9038*width, y: 0.16351*height), control1: CGPoint(x: 0.93808*width, y: 0.14488*height), control2: CGPoint(x: 0.92271*width, y: 0.16351*height))
//        path.closeSubpath()
//
//        return path
//    }
//}

struct EmailBorder: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09383*width, y: 0.00065*height))
        path.addCurve(to: CGPoint(x: 0.00093*width, y: 0.14322*height), control1: CGPoint(x: 0.04277*width, y: 0.00065*height), control2: CGPoint(x: 0.00093*width, y: 0.06485*height))
        path.addLine(to: CGPoint(x: 0.00093*width, y: 0.85603*height))
        path.addCurve(to: CGPoint(x: 0.09383*width, y: 0.99859*height), control1: CGPoint(x: 0.00093*width, y: 0.93439*height), control2: CGPoint(x: 0.04277*width, y: 0.99859*height))
        path.addLine(to: CGPoint(x: 0.90669*width, y: 0.99859*height))
        path.addCurve(to: CGPoint(x: 0.99959*width, y: 0.85603*height), control1: CGPoint(x: 0.95775*width, y: 0.99859*height), control2: CGPoint(x: 0.99959*width, y: 0.93439*height))
        path.addLine(to: CGPoint(x: 0.99959*width, y: 0.14322*height))
        path.addCurve(to: CGPoint(x: 0.90669*width, y: 0.00065*height), control1: CGPoint(x: 0.99959*width, y: 0.06485*height), control2: CGPoint(x: 0.95775*width, y: 0.00065*height))
        path.addLine(to: CGPoint(x: 0.09383*width, y: 0.00065*height))
        path.closeSubpath()
        return path
    }
}

struct EmailUpper: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09383*width, y: 0.07193*height))
        path.addLine(to: CGPoint(x: 0.90669*width, y: 0.07193*height))
        path.addCurve(to: CGPoint(x: 0.91539*width, y: 0.0736*height), control1: CGPoint(x: 0.90971*width, y: 0.07193*height), control2: CGPoint(x: 0.91255*width, y: 0.0728*height))
        path.addLine(to: CGPoint(x: 0.52058*width, y: 0.61543*height))
        path.addCurve(to: CGPoint(x: 0.47993*width, y: 0.61543*height), control1: CGPoint(x: 0.5107*width, y: 0.62898*height), control2: CGPoint(x: 0.48982*width, y: 0.62898*height))
        path.addLine(to: CGPoint(x: 0.08512*width, y: 0.0736*height))
        path.addCurve(to: CGPoint(x: 0.09382*width, y: 0.07193*height), control1: CGPoint(x: 0.08796*width, y: 0.0728*height), control2: CGPoint(x: 0.09081*width, y: 0.07193*height))
        path.addLine(to: CGPoint(x: 0.09383*width, y: 0.07193*height))
        path.closeSubpath()
        return path
    }
}

struct EmailLeft: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.04992*width, y: 0.12092*height))
        path.addLine(to: CGPoint(x: 0.33732*width, y: 0.5152*height))
        path.addLine(to: CGPoint(x: 0.05027*width, y: 0.87997*height))
        path.addCurve(to: CGPoint(x: 0.04737*width, y: 0.85603*height), control1: CGPoint(x: 0.04864*width, y: 0.87257*height), control2: CGPoint(x: 0.04737*width, y: 0.86439*height))
        path.addLine(to: CGPoint(x: 0.04737*width, y: 0.14322*height))
        path.addCurve(to: CGPoint(x: 0.04992*width, y: 0.12095*height), control1: CGPoint(x: 0.04737*width, y: 0.13529*height), control2: CGPoint(x: 0.04843*width, y: 0.12801*height))
        path.addLine(to: CGPoint(x: 0.04992*width, y: 0.12092*height))
        path.closeSubpath()
        return path
    }
}

struct EmailRight: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95059*width, y: 0.12092*height))
        path.addCurve(to: CGPoint(x: 0.95314*width, y: 0.1432*height), control1: CGPoint(x: 0.95207*width, y: 0.12799*height), control2: CGPoint(x: 0.95314*width, y: 0.13527*height))
        path.addLine(to: CGPoint(x: 0.95314*width, y: 0.85601*height))
        path.addCurve(to: CGPoint(x: 0.95024*width, y: 0.87995*height), control1: CGPoint(x: 0.95314*width, y: 0.86439*height), control2: CGPoint(x: 0.95187*width, y: 0.87257*height))
        path.addLine(to: CGPoint(x: 0.66319*width, y: 0.51521*height))
        path.addLine(to: CGPoint(x: 0.95059*width, y: 0.12094*height))
        path.addLine(to: CGPoint(x: 0.95059*width, y: 0.12092*height))
        path.closeSubpath()
        return path
    }
}

struct EmailBotton: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.37251*width, y: 0.56363*height))
        path.addLine(to: CGPoint(x: 0.44908*width, y: 0.66832*height))
        path.addCurve(to: CGPoint(x: 0.55142*width, y: 0.66832*height), control1: CGPoint(x: 0.47812*width, y: 0.70815*height), control2: CGPoint(x: 0.52238*width, y: 0.70815*height))
        path.addLine(to: CGPoint(x: 0.62799*width, y: 0.56363*height))
        path.addLine(to: CGPoint(x: 0.91359*width, y: 0.92671*height))
        path.addCurve(to: CGPoint(x: 0.90669*width, y: 0.92726*height), control1: CGPoint(x: 0.91131*width, y: 0.92721*height), control2: CGPoint(x: 0.90908*width, y: 0.92726*height))
        path.addLine(to: CGPoint(x: 0.09384*width, y: 0.92726*height))
        path.addCurve(to: CGPoint(x: 0.08695*width, y: 0.92671*height), control1: CGPoint(x: 0.09146*width, y: 0.92726*height), control2: CGPoint(x: 0.08922*width, y: 0.92726*height))
        path.addLine(to: CGPoint(x: 0.37251*width, y: 0.56363*height))
        path.closeSubpath()
        return path
    }
}

struct EmailShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09383*width, y: 0.00065*height))
        path.addCurve(to: CGPoint(x: 0.00093*width, y: 0.14322*height), control1: CGPoint(x: 0.04277*width, y: 0.00065*height), control2: CGPoint(x: 0.00093*width, y: 0.06485*height))
        path.addLine(to: CGPoint(x: 0.00093*width, y: 0.85603*height))
        path.addCurve(to: CGPoint(x: 0.09383*width, y: 0.99859*height), control1: CGPoint(x: 0.00093*width, y: 0.93439*height), control2: CGPoint(x: 0.04277*width, y: 0.99859*height))
        path.addLine(to: CGPoint(x: 0.90669*width, y: 0.99859*height))
        path.addCurve(to: CGPoint(x: 0.99959*width, y: 0.85603*height), control1: CGPoint(x: 0.95775*width, y: 0.99859*height), control2: CGPoint(x: 0.99959*width, y: 0.93439*height))
        path.addLine(to: CGPoint(x: 0.99959*width, y: 0.14322*height))
        path.addCurve(to: CGPoint(x: 0.90669*width, y: 0.00065*height), control1: CGPoint(x: 0.99959*width, y: 0.06485*height), control2: CGPoint(x: 0.95775*width, y: 0.00065*height))
        path.addLine(to: CGPoint(x: 0.09383*width, y: 0.00065*height))
        path.closeSubpath()
        //upper
        path.move(to: CGPoint(x: 0.09383*width, y: 0.07193*height))
        path.addLine(to: CGPoint(x: 0.90669*width, y: 0.07193*height))
        path.addCurve(to: CGPoint(x: 0.91539*width, y: 0.0736*height), control1: CGPoint(x: 0.90971*width, y: 0.07193*height), control2: CGPoint(x: 0.91255*width, y: 0.0728*height))
        path.addLine(to: CGPoint(x: 0.52058*width, y: 0.61543*height))
        path.addCurve(to: CGPoint(x: 0.47993*width, y: 0.61543*height), control1: CGPoint(x: 0.5107*width, y: 0.62898*height), control2: CGPoint(x: 0.48982*width, y: 0.62898*height))
        path.addLine(to: CGPoint(x: 0.08512*width, y: 0.0736*height))
        path.addCurve(to: CGPoint(x: 0.09382*width, y: 0.07193*height), control1: CGPoint(x: 0.08796*width, y: 0.0728*height), control2: CGPoint(x: 0.09081*width, y: 0.07193*height))
        path.addLine(to: CGPoint(x: 0.09383*width, y: 0.07193*height))
        path.closeSubpath()
        //Left
        path.move(to: CGPoint(x: 0.04992*width, y: 0.12092*height))
        path.addLine(to: CGPoint(x: 0.33732*width, y: 0.5152*height))
        path.addLine(to: CGPoint(x: 0.05027*width, y: 0.87997*height))
        path.addCurve(to: CGPoint(x: 0.04737*width, y: 0.85603*height), control1: CGPoint(x: 0.04864*width, y: 0.87257*height), control2: CGPoint(x: 0.04737*width, y: 0.86439*height))
        path.addLine(to: CGPoint(x: 0.04737*width, y: 0.14322*height))
        path.addCurve(to: CGPoint(x: 0.04992*width, y: 0.12095*height), control1: CGPoint(x: 0.04737*width, y: 0.13529*height), control2: CGPoint(x: 0.04843*width, y: 0.12801*height))
        path.addLine(to: CGPoint(x: 0.04992*width, y: 0.12092*height))
        path.closeSubpath()
        //Right
        path.move(to: CGPoint(x: 0.95059*width, y: 0.12092*height))
        path.addCurve(to: CGPoint(x: 0.95314*width, y: 0.1432*height), control1: CGPoint(x: 0.95207*width, y: 0.12799*height), control2: CGPoint(x: 0.95314*width, y: 0.13527*height))
        path.addLine(to: CGPoint(x: 0.95314*width, y: 0.85601*height))
        path.addCurve(to: CGPoint(x: 0.95024*width, y: 0.87995*height), control1: CGPoint(x: 0.95314*width, y: 0.86439*height), control2: CGPoint(x: 0.95187*width, y: 0.87257*height))
        path.addLine(to: CGPoint(x: 0.66319*width, y: 0.51521*height))
        path.addLine(to: CGPoint(x: 0.95059*width, y: 0.12094*height))
        path.addLine(to: CGPoint(x: 0.95059*width, y: 0.12092*height))
        path.closeSubpath()
        //Bottom
        path.move(to: CGPoint(x: 0.37251*width, y: 0.56363*height))
        path.addLine(to: CGPoint(x: 0.44908*width, y: 0.66832*height))
        path.addCurve(to: CGPoint(x: 0.55142*width, y: 0.66832*height), control1: CGPoint(x: 0.47812*width, y: 0.70815*height), control2: CGPoint(x: 0.52238*width, y: 0.70815*height))
        path.addLine(to: CGPoint(x: 0.62799*width, y: 0.56363*height))
        path.addLine(to: CGPoint(x: 0.91359*width, y: 0.92671*height))
        path.addCurve(to: CGPoint(x: 0.90669*width, y: 0.92726*height), control1: CGPoint(x: 0.91131*width, y: 0.92721*height), control2: CGPoint(x: 0.90908*width, y: 0.92726*height))
        path.addLine(to: CGPoint(x: 0.09384*width, y: 0.92726*height))
        path.addCurve(to: CGPoint(x: 0.08695*width, y: 0.92671*height), control1: CGPoint(x: 0.09146*width, y: 0.92726*height), control2: CGPoint(x: 0.08922*width, y: 0.92726*height))
        path.addLine(to: CGPoint(x: 0.37251*width, y: 0.56363*height))
        path.closeSubpath()
        return path
    }
}



//struct SVGImageNew: UIViewRepresentable {
//
//    var svgName: String
//
//    func makeUIView(context: Context) -> SVGView {
//        let svgView = SVGView()
//        svgView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)   // otherwise the background is black
//        svgView.fileName = self.svgName
//        svgView.contentMode = .scaleToFill
//        return svgView
//    }
//
//    func updateUIView(_ uiView: SVGView, context: Context) {
//
//    }
//
//}
