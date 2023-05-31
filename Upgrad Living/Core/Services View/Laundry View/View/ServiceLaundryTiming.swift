//
//  ServiceLaundryTiming.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import SwiftUI

struct ServiceLaundryTiming: View {
    var day: String
    var StartTime: String
    var endTime: String
    var Floor: String
    var getIndex: Int
    var lastIndex: Bool
    var body: some View {
        VStack(spacing: 2){
            HStack(spacing: 2){
                if getIndex == 0{
                    Rectangle()
                        .fill(Color(hex: 0xBFECEF))
                        .frame(width: 70, height: 33)
                        .cornerRadius(8, corners: [.topLeft])
                        .cornerRadius(4, corners: [.topRight])
                        .overlay {
                            Text(day)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xFACACE))
                        .frame(maxWidth: .infinity, minHeight: 33, maxHeight: 33)
                        .cornerRadius(4, corners: [.topLeft, .topRight])
                        .overlay {
                            Text("\(StartTime) - \(endTime)")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xD7EBF5))
                        .frame(maxWidth: .infinity,minHeight: 33, maxHeight: 33)
                        .cornerRadius(8, corners: [.topRight])
                        .cornerRadius(4, corners: [.topLeft])
                        .overlay {
                            Text(Floor)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                }else if lastIndex{
                    Rectangle()
                        .fill(Color(hex: 0xBFECEF))
                        .frame(width: 70, height: 33)
                        .cornerRadius(8, corners: [.bottomLeft])
                        .cornerRadius(4, corners: [.bottomRight])
                        .overlay {
                            Text(day)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xFACACE))
                        .frame(maxWidth: .infinity, minHeight: 33, maxHeight: 33)
                        .cornerRadius(4, corners: [.bottomLeft, .bottomRight])
                        .overlay {
                            Text("\(StartTime) - \(endTime)")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xD7EBF5))
                        .frame(maxWidth: .infinity,minHeight: 33, maxHeight: 33)
                        .cornerRadius(8, corners: [.bottomRight])
                        .cornerRadius(4, corners: [.bottomLeft])
                        .overlay {
                            Text(Floor)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                }else{
                    Rectangle()
                        .fill(Color(hex: 0xBFECEF))
                        .frame(width: 70, height: 33)
                        .overlay {
                            Text(day)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xFACACE))
                        .frame(maxWidth: .infinity, minHeight: 33, maxHeight: 33)
                        .overlay {
                            Text("\(StartTime) - \(endTime)")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                    
                    Rectangle()
                        .fill(Color(hex: 0xD7EBF5))
                        .frame(maxWidth: .infinity,minHeight: 33, maxHeight: 33)
                        .overlay {
                            Text(Floor)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                }
            }
        }
    }
}

struct RoundedRectangleWithStrokeZeroLeft: Shape {
    var cornerRadius: CGSize
    
    func path(in rect: CGRect) -> Path {
        let topLeftRadius = cornerRadius.width
        let topRightRadius = cornerRadius.height
        let bottomRightRadius = cornerRadius.height
        let bottomLeftRadius = cornerRadius.height
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius), radius: topRightRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius), radius: bottomRightRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius), radius: bottomLeftRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius), radius: topLeftRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}
