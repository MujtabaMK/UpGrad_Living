//
//  CircularProgressView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
          ZStack {
              Circle()
                  .stroke(
                      Color(hex: 0xE0ECFB),
                      lineWidth: 20
                  )
              Circle()
                  .trim(from: 0, to: progress)
                  .stroke(
                      Color(hex: 0x7165CA),
                      style: StrokeStyle(
                          lineWidth: 20,
                          lineCap: .round
                      )
                  )
                  .rotationEffect(.degrees(-90))
                  // 1
                  .animation(.easeOut, value: progress)

          }
      }
}
