//
//  CustomTabView.swift
//  Reminda
//
//  Created by Dung-pc on 06/10/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var selection: TabViewItem
    @State private var tabs: [TabViewItem]
    
    var content: [Tab]
    
    init(@TabsBuilder content: () -> [Tab]) {
        self.content = content()
        self.tabs = self.content.map({$0.tag})
        self.selection = self.content[0].tag
    }
    
    var body: some View {
        VStack(spacing: 0) {
            renderItems()
            TabView(selection: $selection) {
                ForEach(content) { content in
                    content.content
                        .tag(content.tag)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    
    /// Render items for TabView
    @ViewBuilder private func renderItems() -> some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(tabs, id:  \.self) { tab in
                    tabButton(tab: tab)
                        .onTapGesture {
                            selection = tab
                        }
                }
            }
        }
    }
    
    /// Tab button
    @ViewBuilder private func tabButton(tab: TabViewItem) -> some View {
        Text(tab.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


#Preview {
    CustomTabView() {
        Text("content 1").tabViewItem(TabViewItem(title: "tab 1"))
        Text("content 2").tabViewItem(TabViewItem(title: "tab 2"))
    }
}
