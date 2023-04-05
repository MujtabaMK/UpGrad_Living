//
//  Upgrad_LivingApp.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI

@main
struct Upgrad_LivingApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    @State private var isWalkThrough = UserDefaults.standard.bool(forKey: "isWalkThrough")
    var body: some Scene {
        WindowGroup {
            if isWalkThrough{
                if isLogin{
                    FirstView()
                    //ContentView()
                }else{
                    LoginView()
                }
            }else{
                WalkThrough1()
            }
            
          // LoginView()
            //WalkThrough1()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("App is active")
                break
            case .background:
                print("App is in background")
                break
            case .inactive:
                print("App is inactive")
                break
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
               
            }
        }

    }
}
