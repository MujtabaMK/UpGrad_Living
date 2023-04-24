//
//  DepositPaymentView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 17/04/23.
//

import SwiftUI
import WebKit

struct DepositPaymentView: View {
    @State var title: String = ""
    @State var error: Error? = nil
    @State private var isLoadig = true
    var body: some View {
        NavigationView {
            ZStack{
                WebView(title: $title, url: URL(string: "https://booking.upgradliving.com")!)
                    .onLoadStatusChanged { loading, error in
                        if loading {
                            print("Loading started")
                            self.title = "Loading…"
                            isLoadig = true
                        }
                        else {
                            isLoadig = false
                            print("Done loading.")
                            if let error = error {
                                self.error = error
                                if self.title.isEmpty {
                                    self.title = "Error"
                                }
                            }
                            else if self.title.isEmpty {
                                self.title = "Some Place"
                            }
                        }
                    }
                if isLoadig{
                    LoadingView()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct DepositPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        DepositPaymentView()
    }
}
