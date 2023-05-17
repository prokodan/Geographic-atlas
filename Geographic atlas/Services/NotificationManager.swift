//
//  NotificationManager.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 16.05.2023.
//

import UIKit
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
    }
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { grandted, error in
//            print("Permisson granted: \(grandted)")
            guard grandted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
//            print("Notification settings: \(settings)")
        }
    }
    ///Creating notification with content data for a model, image and time interval
    func scheduleNotification(withModel model: Country, andImage image: UIImage, _ timeInterval: TimeInterval = 3) {
        let identifier = "randomCountry"
        let content = UNMutableNotificationContent()
        let userAction = "User Action"
        
        content.title = "Country of the day"
        content.subtitle = model.name.common
        content.body = "Capital: \(model.capital?.first ?? "No capital"). Population of \(model.name.common): \(String.convertIntWithPrefix(model.population)) people. And its currency is: \(String.convertCurernciesToString(model.currencies))"
        
        let id = ProcessInfo.processInfo.globallyUniqueString
        if let attachment =
            UNNotificationAttachment.create(identifier: id, image: image, options: nil) {
//            print("Added attachment")
            content.attachments = [attachment]
            
        }
        
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction
        content.userInfo = [ "cca2" : "\(model.cca2)" ]
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            print(error?.localizedDescription ?? "Request error")
            
        }
        
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: userAction, actions: [deleteAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    //MARK: - Notification and ViewController Handling
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case UNNotificationDefaultActionIdentifier:
            
            let userInfo = response.notification.request.content.userInfo
            guard let cca2Code = userInfo["cca2"] as? String else { return }
            let countryController = CountryDetails()
            NetworkManager.shared.fetchRequest(Links.countryCCA2.rawValue, andCCA2Code: cca2Code) { result in
                switch result {
                case .success(let country):
                    countryController.dataModel = country.first
                    
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let window = windowScene.windows.first, let rootVC = window.rootViewController as? NavigationController {
                            rootVC.pushViewController(countryController, animated: true)
                        }
                    }
                case .failure(let error):
                    print("Error fetching country via cca2 in push: \(error.localizedDescription)")
                }
            }
        default:
            print("Unknown action")
        }
        completionHandler()
    }
    
    
}
