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
    
    @State private var selection: Category

    //mock
    let tabStack = [Category(id: 0, title: "tab1", icon: nil), Category(id: 1, title: "tab2", icon: nil)]
    
    init() {
        self.selection = tabStack[0]
    }
    
    var body: some View {
        VStack(spacing: 10){
            HomeTabList(tabs: tabStack, selection: $selection)
            TabView(selection: $selection) {
                ForEach(tabStack, id:  \.self) { content in
                    HomeMemoGridView()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .fillParentSize()
        .padding()
        .navigationTitle("Notes")
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "line.3.horizontal")
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    Home()
        .previewSupporter()
}
