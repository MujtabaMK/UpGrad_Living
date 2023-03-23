//
//  HideKeyboard.swift
//  SwiftUIHRApp
//
//  Created by Mujtaba Khan on 11/10/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
