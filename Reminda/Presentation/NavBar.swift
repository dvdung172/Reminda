//
//  NavBar.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack {
            Spacer()
            CircleButtonView(iconName: "magnifyingglass"){
                
            }
        }
        .fillScreenWidth()
    }
}

#Preview {
    NavBar()
}
