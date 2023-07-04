//
//  AppDelegate.swift
//  EgoLyfter
//
//  Created by Joel on 7/4/23.
//

import Foundation
import SwiftUI

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
