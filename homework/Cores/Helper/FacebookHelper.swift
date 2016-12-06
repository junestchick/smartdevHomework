//
//  FacebookHelper.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookHelper: NSObject {
    
    // MARK: - Facebook Helper
    class func facebook(application: UIApplication!, openURL url: NSURL!, sourceApplication: String!, annotation: AnyObject!) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    class func facebook(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]!, enableUpdatesOnAccessTokenChange enable: Bool = true) -> Bool {
        FacebookHelper.enableUpdatesOnFacebookAccessTokenChange(enable: enable)
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    class func enableUpdatesOnFacebookAccessTokenChange(enable: Bool = true) {
        FBSDKProfile.enableUpdates(onAccessTokenChange: enable)
    }
    
    class func currentFacebookAccessToken() -> FBSDKAccessToken! {
        return FBSDKAccessToken.current()
    }
    
    class func currentFacebookProfile() -> FBSDKProfile! {
        return FBSDKProfile.current()
    }
    
    class func loginFacebookManager() -> FBSDKLoginManager {
        let fbManager = FBSDKLoginManager()
        fbManager.loginBehavior = FBSDKLoginBehavior.native
        return fbManager
    }
    
    class func logoutFacebook() {
        FacebookHelper.loginFacebookManager().logOut()
    }
    
    class func defaultFacebookReadPermissions() -> [String] {
        return ["user_birthday", "user_relationships", "user_friends"]
    }
    
    class func defaultFacebookPublishPermissions() -> [String] {
        return ["publish_actions"]
    }
    
}
