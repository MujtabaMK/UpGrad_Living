//
//  Upgrad_LivingApp.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI

@main
struct Upgrad_LivingApp: App {
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    @State private var isWalkThrough = UserDefaults.standard.bool(forKey: "isWalkThrough")
    var body: some Scene {
        WindowGroup {
            if isWalkThrough{
                if isLogin{
                    FormDeclerationView()
                }else{
                    LoginView()
                }
            }else{
                WalkThrough1()
            }
            
           //LoginView()
            //WalkThrough1()
        }
    }
}
