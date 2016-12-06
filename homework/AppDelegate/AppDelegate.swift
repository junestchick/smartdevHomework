//
//  AppDelegate.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
        return FacebookHelper.facebook(application: app, openURL: url as NSURL!, sourceApplication: sourceApplication, annotation: annotation as AnyObject!)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupSDKs()
        return FacebookHelper.facebook(application: application, didFinishLaunchingWithOptions: launchOptions as [NSObject : AnyObject]!)
    }

    fileprivate func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        window?.makeKeyAndVisible()
    }
    
    fileprivate func setupSDKs() {
        IQKeyboardManager.sharedManager().enable = true
    }
    
}

