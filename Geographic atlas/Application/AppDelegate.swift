//
//  AppDelegate.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 12.05.2023.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = NotificationManager.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
            self.notificationCenter.requestAuthorization()
            notificationCenter.notificationCenter.delegate = notificationCenter
        
            return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

}

