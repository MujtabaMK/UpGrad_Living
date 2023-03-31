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
    var body: some Scene {
        WindowGroup {
            if isLogin{
                StudentDetailsView(getIsEditable: "1")
            }else{
                LoginView()
            }
           //LoginView()
            //WalkThrough1()
        }
    }
}
