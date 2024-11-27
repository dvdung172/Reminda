//
//  HomeTabList.swift
//  Reminda
//
//  Created by Dung-pc on 08/10/2024.
//

import SwiftUI

struct HomeTabList: View {
    var tabs: [Category]
    @Binding var selection: Category?
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 10){
                if tabs.isEmpty {
                    EmptyView()
                } else {
                    ForEach(tabs, id:  \.self) { tab in
                        tabButton(tab: tab)
                            .onTapGesture {
                                selection = tab
                            }
                    }
                }
            }
        }
        .onAppear {
            selection = tabs[0]
        }
    }
    
    /// Tab button
    @ViewBuilder private func tabButton(tab: Category) -> some View {
        Text(tab.title)
            .padding(10)
            .frame(minWidth: 70)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .opacity(selection == tab ? 1 : 0.5)
            .animation(.easeInOut, value: selection ?? nil) // 2
            .transition(.slide)
    }
}

#Preview {
    @State var selection: Category? = Category(id: "0", title: "tab1", icon: nil, dateAdded: Date(), dateUpdate: Date())
    let tabStack = [Category(id: "0", title: "tab1", icon: nil, dateAdded: Date(), dateUpdate: Date()), Category(id: "1", title: "tab2", icon: nil, dateAdded: Date(), dateUpdate: Date())]
    return HomeTabList(tabs: tabStack, selection: $selection)
}

