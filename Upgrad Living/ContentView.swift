//
//  ContentView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import Macaw
import SVGView

struct ContentView: View {
    var body: some View {
//         SVGImageNew(svgName: "Blood_Group")
//         .frame(width: 200, height: 200)
//         .foregroundColor(.red)
        // SVGView(fileURL: Bundle.main.url(forResource: "Blood_Group", withExtension: "svg")!)
        
        
        let view = SVGView(contentsOf: Bundle.main.url(forResource: "Blood_Group", withExtension: "svg")!)
        if let part = view.getNode(byId: "part") {
            part.onTapGesture {
//                part.opacity = 0.2
                print("Clicked")
            }
        }
        return view

        
      //  Image(uiImage: UIImage(named: "Blood_Group") ?? UIImage())

//        BloodGroupView()
//            .frame(width: 200, height: 200)
//            .foregroundColor(.pink)
//            .onTapGesture {
//                print("Clicked")
//            }


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
