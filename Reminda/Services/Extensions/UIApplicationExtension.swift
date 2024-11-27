//
//  UIApplicationExtension.swift
//  Reminda
//
//  Created by Dung-pc on 23/11/2024.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
