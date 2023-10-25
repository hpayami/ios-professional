//
//  AppDelegate.swift
//  Bankey
//
//  Created by Hossein Payami on 8/4/1402 AP.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        window?.rootViewController = LoginViewController()

        return true
    }

}

