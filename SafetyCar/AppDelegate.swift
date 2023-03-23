//
//  AppDelegate.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit
import FirebaseCore
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    private lazy var appStore: StoreType = Store()
//    private lazy var appNavigationController: NavigationController = NavigationController()
//    private lazy var appRouter: RouterType = Router(navigationController: self.appNavigationController)
//    private lazy var appCoordinator: AppCoordinator = AppCoordinator(router: self.appRouter,
//                                                                     store: self.appStore)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        let appearance = UINavigationBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
           appearance.backgroundColor = .white
           let proxy = UINavigationBar.appearance()
           proxy.tintColor = .black
           proxy.standardAppearance = appearance
           proxy.scrollEdgeAppearance = appearance
        
//        do {
//            try Auth.auth().signOut()
//            print("success logout")
//        } catch {
//            print("error logiut")
//        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

