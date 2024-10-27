//
//  HomeTabList.swift
//  Reminda
//
//  Created by Dung-pc on 08/10/2024.
//

import SwiftUI

struct HomeTabList: View {
    var tabs: [Category]
    @Binding var selection: Category
    
    var body: some View {
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
    @ViewBuilder private func tabButton(tab: Category) -> some View {
        Text(tab.title)
            .padding()
            .frame(minWidth: 70)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .opacity(selection == tab ? 1 : 0.5)
            .animation(.easeInOut, value: selection) // 2
            .transition(.slide)
    }
}

#Preview {
    @State var selection = Category(id: "0", title: "tab1", icon: nil)
    let tabStack = [Category(id: "0", title: "tab1", icon: nil), Category(id: "1", title: "tab2", icon: nil)]
    return HomeTabList(tabs: tabStack, selection: $selection)
}

