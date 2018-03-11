//
//  ViewController.swift
//  userNotification
//
//  Created by RASHED on 3/6/18.
//  Copyright © 2018 ugoround. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if error != nil {
                print ("Print authorization unsuccessfull")
            } else {
                print ("Authorization successful")
            }
            
        }
    }
    
    
    @IBAction func notifyPressed(_ sender: UIButton) {
        timeNotifications(inSeconds: 3) { (success) in
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    //    func notifyPressed () {
    //        timeNotifications(inSeconds: 3) { (success) in
    //            if success {
    //                print("i am printing")
    //            }
    //        }
    //    }
    
    
    func timeNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> () ) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = "Breaking News"
        content.subtitle = "Net Nutrality is not working"
        content.body = "In publishing and graphic design, lorem ipsum is a filler text or greeking commonly used to demonstrate the textual elements of a graphic document or visual presentation. Replacing meaningful content with placeholder text allows designers to design the form of the content before the content itself has been produced"
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                completion(false)
            }else{
                completion(true)
            }
        }
        
    }
    
}

