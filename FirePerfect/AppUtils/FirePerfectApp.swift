//
//  FirePerfectApp.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 20/01/24.
//

import SwiftUI

@main
struct FirePerfectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}
