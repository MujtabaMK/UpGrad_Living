//
//  WebView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 17/04/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var title: String
    @Binding var SendToNextPage: Bool
    var url: URL
    var loadStatusChanged: ((Bool, Error?) -> Void)? = nil
    @State private var sendURL = ""
    
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.load(URLRequest(url: url))
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // you can access environment via context.environment here
        // Note that this method will be called A LOT
    }

    func onLoadStatusChanged(perform: ((Bool, Error?) -> Void)?) -> some View {
        var copy = self
        copy.loadStatusChanged = perform
        return copy
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
        let parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print(webView.url as Any)
            parent.loadStatusChanged?(true, nil)
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print(webView.url as Any)
            parent.title = webView.title ?? ""
            webView.evaluateJavaScript("document.getElementsByName('applnID')[0].value='\(studentAppID!)'", completionHandler: nil)
            parent.sendURL = webView.url?.absoluteString ?? ""
            if parent.sendURL == "https://booking.upgradliving.com/successPayment"{
                parent.SendToNextPage = true
            }
            parent.loadStatusChanged?(false, nil)
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.loadStatusChanged?(false, error)
        }
    }
}
