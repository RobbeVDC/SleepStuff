//
//  AppDelegate.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit
import SVProgressHUD
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.setupHud()
        
        IQKeyboardManager.sharedManager().enable = true

        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        self.window?.rootViewController = navController
        
        self.coordinator = AppCoordinator(navigationController: navController)
        self.coordinator?.start()
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setupHud() {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setForegroundColor(.white)
    }
    
}
