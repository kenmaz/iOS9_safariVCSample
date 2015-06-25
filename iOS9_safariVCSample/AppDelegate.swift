//
//  AppDelegate.swift
//  iOS9_safariVCSample
//
//  Created by Kentaro Matsumae on 2015/06/18.
//  Copyright © 2015年 Kentaro Matsumae. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        NSNotificationCenter.defaultCenter().postNotificationName(kSafariViewControllerCloseNotificationName, object: nil)
        return true
    }
}

