//
//  customLodingIndicator.swift
//  SwiftCoin
//
//  Created by Mujtaba Khan on 07/10/22.
//

import SwiftUI

struct customLodingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
            .frame(width: 80, height: 80)
            .background(Color(.systemGray4))
            .cornerRadius(20)
    }
}

struct customLodingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        customLodingIndicator()
    }
}
