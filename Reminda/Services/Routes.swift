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
    case AddingMemo
    case Profile
    case Setting
    case Home
    case none
    
    public static func == (lhs: Routes, rhs: Routes) -> Bool {
        switch (lhs, rhs) {
        case (.AddingMemo, .AddingMemo),
            (.Profile, .Profile),
            (.Setting, .Setting),
            (.Home, .Home),
            (.none, .none):
            return true
            
        default:
            return false
        }
    }
}
