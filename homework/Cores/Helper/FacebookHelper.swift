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
}
