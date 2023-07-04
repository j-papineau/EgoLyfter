//
//  EgoLyfterApp.swift
//  EgoLyfter
//
//  Created by Joel on 6/28/23.
//
import FirebaseCore
import SwiftUI


@main
struct EgoLyfterApp: App {
    
    init(){
        FirebaseApp.configure()
    } //not needed?
    
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            MainView().preferredColorScheme(.dark)
        }
    }
}
