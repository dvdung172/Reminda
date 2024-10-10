//
//  HomeMemoItem.swift
//  Reminda
//
//  Created by Dung-pc on 09/10/2024.
//

import SwiftUI

struct HomeMemoItem: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("header")
                .font(.largeTitle)
            Text("3By default SwiftUI views will mostly stay inside the safe area. It will go to the bottom of the screen, but it won’t go near any notch at the top of the device. If you want your view to be truly full screen, then you should use the edgesIgnoringSafeArea() modifier.")
        }
        .padding(8)
        .background(Color.blue)
        .cornerRadius(20)
        .fillParentWidth()
    }
}

#Preview {
    HomeMemoItem()
}
