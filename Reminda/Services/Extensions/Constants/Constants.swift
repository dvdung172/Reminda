//
//  Constants.swift
//  JF_IOS
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI
import UIKit

struct UIConstants {
    
    private init() {}
    
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    static let fullWidthOffset: CGFloat = CGFloat(32)
    
    static let fullWidthInWhiteBoxOffset: CGFloat = CGFloat(48) // Full width offset + 2 times of horizotal padding (value is 8)
    
    static let groupItemSpacing: CGFloat = CGFloat(8)
    
    static let contentItemSpacing: CGFloat = CGFloat(16)
    
    static let disabledItemOpacity: Double = 0.3
    
}
