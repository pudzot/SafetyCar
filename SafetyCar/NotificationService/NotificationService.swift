//
//  NotificationService.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//
import UserNotifications
import UIKit
import CoreLocation

class NotificationService: NSObject {
    
    //1. Singleton Class
    private override init() { }
    static let sharedInstance = NotificationService()
    
    //2. Get the current UNUserNotificationCenter
    let UNCurrentCenter = UNUserNotificationCenter.current()
    
    //3. Request the user authorization to send alerts.
    func authorizeNotification() {
        
        //3.1. Setting up the options the way you want to interact with the user.
        let options:UNAuthorizationOptions = [.alert, .badge, .sound]
        
        //3.2. Requests authorization with the user to deliver notification.
        UNCurrentCenter.requestAuthorization(options: options) { (granted, error) in
             print(error ?? "No UNAuthorization error")
            
            //3.3. completionHandler falls after the user's choice(maybe or maynot be granted).
            guard granted else {
                print("User Denied the permission to receive Push")
                return
            }
            
            //3.4. Conform to UNUserNotificationCenterDelegate
            self.UNCurrentCenter.delegate = self
        }
    }
    
    func requestLocationNotification(repeatedly:Bool = false) {
        let content      = UNMutableNotificationContent()
        content.title    = NotificationTitle.leaveZone.rawValue
        content.subtitle = NotificationSubtitle.leaveZone.rawValue
        content.sound    = UNNotificationSound(named: .leaveZone)
        
      // Get the user's current Location
        LocationService.sharedInstance.updateLocation()

        //Getting the user's current region based on the current location
        LocationService.sharedInstance.didUpdateLocation = { [unowned self] (location) in
            print(location)
            let home = CLLocation(latitude: 22.0158857, longitude: 22.0095755)
            let region = LocationService.sharedInstance.getCurrentRegion(For: location)
            region.notifyOnEntry = false  // specified to provide notifications to be delivered on entry only
            region.notifyOnExit  = true // specified to restrict notifications to be delivered on exit.

            let locationTrigger  = UNLocationNotificationTrigger(region: region, repeats: repeatedly)
            let request          = UNNotificationRequest(identifier: NotificationRequestIdentifier.leaveZone.rawValue,
                                                         content: content,
                                                         trigger: locationTrigger)
            //Remove the pending request if needed
            self.removePendingNotifications(NotificationRequestIdentifier.leaveZone.rawValue)

            //Add the request to the current UNUserNotificationCenter
            self.UNCurrentCenter.add(request)
        }
    }
    
    func removePendingNotifications(_ requestIdentifier:String) {
        guard requestIdentifier != "" else { return }
        UNCurrentCenter.getPendingNotificationRequests(completionHandler: { [unowned self] requests in
            let pendingTimerRequests = requests.filter { return $0.identifier == requestIdentifier }.map{ $0.identifier }
            self.UNCurrentCenter.removePendingNotificationRequests(withIdentifiers: pendingTimerRequests)
        })
    }

    func removeAllPendingNotifications() {
        self.UNCurrentCenter.removeAllPendingNotificationRequests()
    }
}

extension NotificationService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                    withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceive response: \(response.notification.request.content.userInfo)")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresent: \(notification.request.identifier)")
        
        NotificationCenter.default.post(name: Notification.Name("UserLoggedIn"), object: nil)
        
        let options:UNNotificationPresentationOptions = [.banner, .sound]
        completionHandler(options)
    }
}
