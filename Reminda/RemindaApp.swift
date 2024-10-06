//
//  RemindaApp.swift
//  Reminda
//
//  Created by Dung-pc on 29/09/2024.
//

import SwiftUI

@main
struct RemindaApp: App {
    @StateObject private var router = Router()
    
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.foreground)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.foreground)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.foreground)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if showLaunchView {
                    LaunchView(showLaunchView: $showLaunchView)
                } else {
                    Main()
                }
            }
            .environmentObject(router)
//            .environment(\.colorScheme, .dark)
            
        }
    }
}
