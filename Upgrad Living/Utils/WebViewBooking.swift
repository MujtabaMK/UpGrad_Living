//
//  WebViewBooking.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/05/23.
//

import SwiftUI
import WebKit

struct WebViewBooking: UIViewRepresentable {
    @Binding var title: String
    @Binding var CallLoad: Bool
    @Binding var isToCallAPI: Bool
    @Binding var sendData: [String]
    var url: URL
    var loadStatusChanged: ((Bool, Error?) -> Void)? = nil
    //let scriptMessageHandler = ScriptMessageHandler()
    
    func makeCoordinator() -> WebViewBooking.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
//        let config = WKWebViewConfiguration()
//        config.userContentController = WKUserContentController()
//        config.userContentController.add(scriptMessageHandler, name: "backHomePage")
//
//        let view = WKWebView(frame: CGRect(x: 0, y: 0, width: getRect().width, height: getRect().height), configuration: config)
//        view.navigationDelegate = context.coordinator
//        print(url)
//
//        view.load(URLRequest(url: url))
//        return view
        
        
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        print(url)

        view.load(URLRequest(url: url))
        return view

    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // you can access environment via context.environment here
        // Note that this method will be called A LOT
        if CallLoad{
            uiView.load(URLRequest(url: url))
        }
    }
    
    func onLoadStatusChanged(perform: ((Bool, Error?) -> Void)?) -> some View {
        var copy = self
        copy.loadStatusChanged = perform
        return copy
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
        let parent: WebViewBooking
        
        init(_ parent: WebViewBooking) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print(webView.url as Any)
            parent.loadStatusChanged?(true, nil)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print(webView.url as Any)
            parent.title = webView.title ?? ""
            parent.loadStatusChanged?(false, nil)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.loadStatusChanged?(false, error)
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
            
            guard let urlAsString = navigationAction.request.url?.absoluteString.lowercased() else {
                return
            }
            
            print(urlAsString)
            let fullNameArr = urlAsString.components(separatedBy: "-")
            if fullNameArr.count > 1{
                parent.isToCallAPI = true
                parent.sendData = fullNameArr
            }
            
            if urlAsString.range(of: "the url that the button redirects the webpage to") != nil {
                // do something
                print(urlAsString)
            }
        }
    }
//    class ScriptMessageHandler: NSObject, WKScriptMessageHandler {
//        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//            print(message.body)
//        }
//    }

}
