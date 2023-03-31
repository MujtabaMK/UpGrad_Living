//
//  AnimatableCustomFontModifier.swift
//  ATLAS VMS
//
//  Created by Mujtaba Khan on 10/01/23.
//

import Foundation
import UIKit
import SwiftUI

struct AnimatableCustomFontModifier: AnimatableModifier {
    
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}

extension View {
    func animatableFont(size: CGFloat) -> some View {
        modifier(AnimatableCustomFontModifier(size: size))
    }
}
