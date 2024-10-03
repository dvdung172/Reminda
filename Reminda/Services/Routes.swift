//
//  Routes.swift
//  Reminda
//
//  Created by Dung-pc on 02/10/2024.
//

import SwiftUI

class Router : ObservableObject {
    @Published var navigationPath = NavigationPath()

    func navigateTo(_ route: Routes) {
        navigationPath.append(route)
    }
}

enum Routes: Hashable, Equatable {
    case Detail
    case Profile
    case Setting
    case none
    
    public static func == (lhs: Routes, rhs: Routes) -> Bool {
        switch (lhs, rhs) {
        case (.Detail, .Detail),
            (.Profile, .Profile),
            (.Setting, .Setting),
            (.none, .none):
            return true
            
        default:
            return false
        }
    }
}