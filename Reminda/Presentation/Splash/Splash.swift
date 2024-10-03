//
//  ContentView.swift
//  Reminda
//
//  Created by Dung-pc on 29/09/2024.
//

import SwiftUI

struct Splash: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Image(systemName: "note.text")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Reminda!")
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                router.navigateTo(.Detail)
            }
        }
    }
}

#Preview {
    Splash()
        .previewSupporter()
}
