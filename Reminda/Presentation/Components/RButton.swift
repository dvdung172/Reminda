//
//  RButton.swift
//  Reminda
//
//  Created by Dung-pc on 04/11/2024.
//

import SwiftUI

struct RButton<Label> : View where Label : View {
    @State private var isClicked = false
    let action: () -> Void
    let label: () -> Label
    
    init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: {
            if !isClicked {
                isClicked = true
                self.action()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isClicked = false
                }
            }
            
        }, label: self.label)
        .disabled(isClicked)

    }
}

#Preview {
    RButton (action: {}, label: {Text("RButton")})
}
