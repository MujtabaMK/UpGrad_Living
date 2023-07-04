//
//  RentView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 05/05/23.
//

import SwiftUI

struct RentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    
    @State var title: String = ""
    @State var error: Error? = nil
    @State private var isLoadig = true
    @State private var isSendToSuccess = false
    
    var body: some View {
        NavigationView {
            ZStack{
                WebViewRent(title: $title, SendToNextPage: $isSendToSuccess, url: URL(string: "https://booking.upgradliving.com")!)
                    .onLoadStatusChanged { loading, error in
                        if loading {
                            print("Loading started")
                            self.title = "Loading…"
                            isLoadig = true
                        }else {
                            isLoadig = false
                            print("Done loading.")
                            if let error = error {
                                self.error = error
                                if self.title.isEmpty {
                                    self.title = "Error"
                                }
                            }else if self.title.isEmpty {
                                self.title = "Some Place"
                            }
                        }
                    }
                if isLoadig{
                    LoadingView()
                }
                NavigationLink(
                    "",
                    destination: SecurityDepositSuccess().navigationBarHidden(true),
                    isActive: $isSendToSuccess).isDetailLink(false)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
    }
}
