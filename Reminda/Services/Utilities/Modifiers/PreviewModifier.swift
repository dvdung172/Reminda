//
//  PreviewModifier.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct PreviewModifier: ViewModifier {
    @State private var router = Router()
    
    func body(content: Content) -> some View {
        NavigationView{
            content
        }
            
            .environmentObject(router)
        }
}

