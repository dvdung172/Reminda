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
        NavigationView {
            VStack {
                Image(systemName: "note.text")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Reminda!")
                    .onTapGesture {
                        router.navigateTo(.Detail)
                    }
            }
//            .padding()
            .background(.red)
        }
//        .navigationTitle("Notes")
//        .ignoresSafeArea()
    }
}

#Preview {
    Home()
        .previewSupporter()
}
