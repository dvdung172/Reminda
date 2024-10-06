//
//  Home.swift
//  Reminda
//
//  Created by Dung-pc on 03/10/2024.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var router: Router
    
    @State private var text = ""
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 12.0
    
    var body: some View {
        VStack {
            Image(systemName: "note.text")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Reminda!")
                .onTapGesture {
                    router.navigateTo(.Detail)
                }
        }
        .fillDeviceScreen()
        .navigationTitle("Notes")
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "line.3.horizontal")
            }
        }
    }
}

#Preview {
    Home()
        .previewSupporter()
}
