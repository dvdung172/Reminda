//
//  ColorExtensions.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    
    let foreground = Color("ForegroundColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    
}

struct LaunchTheme {
    let foreground = Color("LaunchForegroundColor")
    let background = Color("LaunchBackgroundColor")
    
}
