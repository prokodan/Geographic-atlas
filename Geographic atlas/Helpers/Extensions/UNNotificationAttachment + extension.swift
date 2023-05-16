//
//  UNNotificationAttachment + extension.swift
//  Geographic atlas
//
//  Created by Данил Прокопенко on 16.05.2023.
//

import UIKit
import UserNotifications

extension UNNotificationAttachment {
    ///Attaching UIImage to UNNotificationAttachment
    static func create(identifier: String, image: UIImage, options: [NSObject: AnyObject]?) -> UNNotificationAttachment? {
        let fileManger = FileManager.default
        let tmpSubFolderName = ProcessInfo.processInfo.globallyUniqueString
        let tmpSubFolderURL = URL(filePath: NSTemporaryDirectory()).appendingPathComponent(tmpSubFolderName, isDirectory: true)
        do {
            try fileManger.createDirectory(at: tmpSubFolderURL, withIntermediateDirectories: true, attributes: nil)
            let imageFileIdentifier = identifier + ".png"
            let fileURL = tmpSubFolderURL.appendingPathComponent(imageFileIdentifier)
            let imageData = UIImage.pngData(image)
            try imageData()?.write(to: fileURL)
            let imageAttachment = try UNNotificationAttachment.init(identifier: imageFileIdentifier, url: fileURL, options: options)
            return imageAttachment
        } catch {
            print("Error with writing image: " + error.localizedDescription)
        }
        return nil
    }
}
