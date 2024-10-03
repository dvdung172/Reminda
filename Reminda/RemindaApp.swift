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
    
    var body: some Scene {
        WindowGroup {
            Main()
                .environmentObject(router)
        }
    }
}
