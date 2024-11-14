//
//  Components.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    var onTap: () -> Void
    
    @State var tap = false
    
    var body: some View {
        RButton(action: onTap) {
            Image(systemName: iconName)
                .font(.headline)
                .foregroundColor(Color.theme.foreground)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundColor(Color.theme.background)
                )
                .shadow(
                    color: Color.theme.foreground.opacity(0.25),
                    radius: 10, x: 0, y: 0)
        }
    }
}

#Preview {
    Group {
        CircleButtonView(iconName: "info") {
            
        }
        .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName: "plus") {
            
        }
        .previewLayout(.sizeThatFits)
        //            .preferredColorScheme(.dark)
    }
}
