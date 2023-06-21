//
//  Upgrad_LivingApp.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import IQKeyboardManagerSwift
import FirebaseCore
import FirebaseAnalytics
import FirebaseMessaging
import UserNotifications

@main
struct Upgrad_LivingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var networkMonitor = NetworkMonitor()
    @Environment(\.scenePhase) var scenePhase
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    @State private var isWalkThrough = UserDefaults.standard.bool(forKey: "isWalkThrough")
    
    var body: some Scene {
        WindowGroup {
            if isWalkThrough{
                if isLogin{
                    FirstView(EventScreen: "", newSelectedIndex: .constant(0))
                        .environmentObject(networkMonitor)
                }else{
                    LoginView()
                        .environmentObject(networkMonitor)
                }
            }else{
                WalkThrough1()
                    .environmentObject(networkMonitor)
            }
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

class AppDelegate: NSObject, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        IQKeyboardManager.shared.enable = true

        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
                
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print(deviceToken) // This token can be used for testing notifications on FCM
        let newFcmToken = deviceToken["token"]
        print(newFcmToken ?? "")
        UserDefaults.standard.set(newFcmToken, forKey: "fcmdeviceToken")
    }
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        print(userInfo)

        // Change this to your preferred presentation option
        completionHandler([[.banner, .badge, .sound]])
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID from userNotificationCenter didReceive: \(messageID)")
        }
        
        print(userInfo)
        
        AppState.shared.pageToNavigationTo = "Service"
        UserDefaults.standard.setValue("2", forKey: "SendPageTo")
        
        completionHandler()
    }
}

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var pageToNavigationTo : String?
}
